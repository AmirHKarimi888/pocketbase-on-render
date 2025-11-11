FROM alpine:latest

WORKDIR /app

# Install dependencies
RUN apk add --no-cache ca-certificates curl unzip

# Download latest PocketBase release (linux amd64)
RUN curl -L "https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip" -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip

# Create data directory
RUN mkdir /app/pb_data

EXPOSE 8080

# Run PocketBase
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
