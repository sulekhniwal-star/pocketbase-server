FROM alpine:3.20

# Install dependencies
RUN apk add --no-cache curl unzip ca-certificates

# Create app directory
WORKDIR /app

# Download PocketBase
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.0/pocketbase_0.23.0_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip

# Create persistent data directory
RUN mkdir /pb_data

# Expose Railway port
EXPOSE 8080

# Start PocketBase using Railway's dynamic port
CMD ./pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data
