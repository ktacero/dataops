#!/bin/bash

# 'docker build' se utiliza para construir una imagen de Docker a partir de un archivo Dockerfile y un contexto.

# '-t' se utiliza para asignar un nombre y una etiqueta a la imagen que se está construyendo.
# En este caso, se le está asignando el nombre 'python-runner' a la imagen.

# '.' especifica el contexto o el directorio actual como el contexto de construcción.
# El contexto incluye todos los archivos y directorios en el directorio actual y se utilizarán para construir la imagen.

docker build -t python-runner .

