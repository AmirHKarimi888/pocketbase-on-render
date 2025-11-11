FROM alpine:latest

WORKDIR /app

# Install dependencies
RUN apk add --no-cache ca-certificates curl unzip

# Download specific PocketBase version (avoid redirect issues)
ENV PB_VERSION=0.22.15

RUN curl -L "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip

# Create data directory
RUN mkdir /app/pb_data

EXPOSE 8080

# Run PocketBase
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
