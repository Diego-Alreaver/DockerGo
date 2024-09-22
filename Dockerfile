# Etapa 1: Construir el binario de la aplicación
FROM golang:1.20-alpine AS builder

# Crear un directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos de código al directorio de trabajo
COPY . .

# Compilar la aplicación
RUN go mod init app && \
    go mod tidy && \
    go build -o server .

# Etapa 2: Crear una imagen ligera para ejecutar el binario
FROM alpine:3.18

# Crear un directorio de trabajo
WORKDIR /app

# Copiar el binario desde la etapa de construcción
COPY --from=builder /app/server .

# Exponer el puerto en el que correrá el servidor (por defecto 8080)
EXPOSE 8080

# Establecer la variable de entorno PORT con un valor por defecto de 8080
ENV PORT=8080

# Ejecutar la aplicación
CMD ["./server"]
