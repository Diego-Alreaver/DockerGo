# Usar la imagen base Debian slim
FROM debian:stable-slim

# Copiar el binario de la aplicación compilada a /bin/hellogo
ADD hellogo /bin/hellogo

# Establecer la variable de entorno para el puerto
ENV PORT=8080

# Exponer el puerto
EXPOSE 8080

# Ejecutar la aplicación
CMD ["/bin/hellogo"]
