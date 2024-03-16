# Inicia con la imagen base de MySQL
FROM mysql:8.0.23

# Importa datos al contenedor
# Todos los scripts en docker-entrypoint-initdb.d/ se ejecutan automáticamente durante el inicio del contenedor
COPY ./database/*.sql /docker-entrypoint-initdb.d/
