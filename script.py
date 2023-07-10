import yaml
import os
import datetime
from google.cloud import storage, pubsub_v1
import json
import dask.dataframe as dd

# Mostrar contenido directorio montado

print("Contenido del directorio montado:")
print(os.listdir(os.environ['MOUNTED_DIR']))

# Carga la configuración desde el archivo YAML
with open('/app/config.yml', 'r') as f:
    config = yaml.safe_load(f)

# Rutas de los archivos
csv_filepath = os.path.join(os.environ['MOUNTED_DIR'], config['csv_filename'])

# Configura el cliente de Google Cloud Storage
storage_client = storage.Client.from_service_account_json('/app/' + config['credentials_path'])

# Configura el cliente de Google Pub/Sub
publisher = pubsub_v1.PublisherClient.from_service_account_json('/app/' + config['credentials_path'])

topic_name = f'projects/{config["project_id"]}/topics/{config["topic_name"]}'

# Carga el archivo CSV a Google Cloud Storage
bucket = storage_client.bucket(config['bucket_name'])
blob = bucket.blob(config['csv_filename'])
blob.upload_from_filename(csv_filepath)

print("Archivo cargado a GCS.")

# Lee el archivo CSV con dask.dataframe para inferir la estructura y tamaño
sep = config['separador']
ddf = dd.read_csv(csv_filepath, sep=sep)

# Calcula el esquema del archivo y el tamaño
schema = ddf.compute().dtypes.to_dict()
size = ddf.shape[0].compute()  # Obtiene el tamaño del archivo

# Obtiene la fecha de creación del archivo
created_timestamp = os.path.getctime(csv_filepath)
created_date = datetime.datetime.fromtimestamp(created_timestamp)

# Metadata
metadata = {
    "size": int(size),
    "schema": {col: str(dtype) for col, dtype in schema.items()},  # Convierte los dtypes a strings
    "created_date": created_date.isoformat(),  # Agrega la fecha de creación en formato ISO
    "file_name": os.path.basename(csv_filepath),  # Agrega el nombre del archivo
    "num_columns": len(schema),  # Agrega el número de columnas
    "column_names": list(schema.keys()),  # Agrega los nombres de las columnas
    "unique_values_per_column": {col: int(ddf[col].drop_duplicates().compute().nunique()) for col in ddf.columns},  # Agrega valores únicos por columna
    # Agrega cualquier otra metadata que desees incluir
}
# Convierte la metadata a un string de JSON
metadata_str = json.dumps(metadata)

# Publica la metadata en el tópico de Pub/Sub
future = publisher.publish(topic_name, metadata_str.encode('utf-8'))
print(future.result())

print("Mensaje publicado en Pub/Sub.")
