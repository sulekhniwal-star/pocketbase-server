FROM alpine:latest

RUN apk add --no-cache unzip curl

WORKDIR /app

RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.0/pocketbase_0.23.0_linux_amd64.zip -o pb.zip \
 && unzip pb.zip \
 && rm pb.zip

EXPOSE 8090

CMD ./pocketbase serve --http=0.0.0.0:8090 --dir=/pb_data && \
    ./pocketbase superuser create admin@example.com password123 
