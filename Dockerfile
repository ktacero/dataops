# Usa una imagen base de Python
FROM python:3.9

# Establece un directorio de trabajo
WORKDIR /app

# Copiando script para ejecutar
COPY script.py /app/script.py

# Copiando cuenta de servicio
COPY deacero-dataops-corp-cytfr9-b58c6f59eb13.json /app/deacero-dataops-corp-cytfr9-b58c6f59eb13.json

# Copiando YML de configuración a Workdir
COPY config.yml /app/config.yml

# Instala las dependencias
RUN pip install google-cloud-storage google-cloud-pubsub pyyaml dask

# Define la variable de entorno con la ruta al directorio montado
ENV MOUNTED_DIR=/mnt/data


# Ejecuta el script de Python
CMD ["python", "./script.py"]
