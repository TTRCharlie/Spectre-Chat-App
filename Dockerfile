FROM python:3.15.0b4-alpine3.24 AS builder
RUN apk add --no-cache build-base
WORKDIR /app
COPY . ./
RUN pip install pyinstaller textual rich;pyinstaller --onefile --name spectre-server --collect-all textual server.py

FROM alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist/spectre-server ./spectre-server
RUN apk add --no-cache openssl
EXPOSE 8888
ENTRYPOINT ["/app/spectre-server"]
