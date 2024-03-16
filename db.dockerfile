FROM golang:1.16-alpine

WORKDIR /app

# Instalación de paquetes necesarios
RUN apk update && \
    apk add libc-dev gcc make

# Instalación de Compile Daemon para Go
RUN go get github.com/githubnemo/CompileDaemon

# Instalación de mux desde Gorilla para manejar métodos HTTP
RUN go get -u github.com/gorilla/mux

# Copia y construye la aplicación
COPY . .

# Copia del script de punto de entrada y otorga permisos de ejecución
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# wait-for requiere bash, que alpine no incluye por defecto. Usaremos wait-for en su lugar.
ADD https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for /usr/local/bin/wait-for
RUN chmod +x /usr/local/bin/wait-for

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
