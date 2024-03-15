FROM golang:1.16-alpine

# Set the working directory inside the container
WORKDIR /app

# Add some necessary packages
RUN apk update && \
    apk add libc-dev gcc make

# Install CompileDaemon for Go. We'll use it to watch changes in Go files
RUN go get github.com/githubnemo/CompileDaemon

# Copy the source code into the container
COPY . .

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# wait-for-it requires bash, which Alpine doesn't ship with by default. Use wait-for instead
ADD https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for /usr/local/bin/wait-for
RUN chmod +rx /usr/local/bin/wait-for /entrypoint.sh

# Specify the entrypoint script to run when the container starts
ENTRYPOINT [ "sh", "/entrypoint.sh" ]
