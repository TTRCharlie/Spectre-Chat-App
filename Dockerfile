FROM python:3.15.0b4-alpine3.24
LABEL org.opencontainers.image.source="https://github.com/spectre-chat/spectre-chat-app"
WORKDIR /app
COPY server.py ./
RUN apk add --no-cache openssl
EXPOSE 8888
ENTRYPOINT ["server.py"]