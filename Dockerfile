FROM alpine:latest

WORKDIR /app

# Install SSL certificates
RUN apk add --no-cache ca-certificates

# Copy PocketBase binary into image
COPY pocketbase /app/pocketbase

# Create data folder
RUN mkdir /app/pb_data

EXPOSE 8080

# Run PocketBase
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
