#!/bin/bash

# 'docker run' se utiliza para crear un contenedor a partir de una imagen de Docker.
# La imagen que se utilizará en este caso es 'python-runner'.

# '-it' es una combinación de dos opciones. '-i' asegura que se mantiene abierta la entrada estándar (stdin) del contenedor
# incluso si no está conectada. Esto permite interactuar con el contenedor.
# '-t' asigna una pseudo-TTY o terminal al contenedor. Esto hace que el contenedor se comporte como si estuviera conectado a una terminal.

# '--rm' indica que el contenedor debe eliminarse automáticamente cuando se detenga. 
# Esto es útil para no dejar contenedores inactivos después de su uso.

# '-v' se utiliza para montar volúmenes. Los volúmenes permiten compartir archivos y directorios entre el host y el contenedor.
# En este caso, se está compartiendo el directorio '/Users/karim/Google Drive/My Drive/DeAcero/DataOps PoC/data' del host
# con el directorio '/mnt/data' del contenedor. 
# Los archivos que se coloquen en uno de estos directorios estarán disponibles en el otro.

docker run -it --rm -v "/Users/karim/Google Drive/My Drive/DeAcero/DataOps PoC/data":/mnt/data python-runner
