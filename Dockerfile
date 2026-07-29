FROM python:3.15.0b4-alpine3.24
WORKDIR /app
COPY server.py ./
RUN apk add --no-cache openssl
EXPOSE 8888
ENTRYPOINT ["python3", "server.py"]