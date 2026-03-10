FROM alpine:3.20

RUN apk add --no-cache curl unzip

WORKDIR /app

RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.0/pocketbase_0.23.0_linux_amd64.zip -o pb.zip \
 && unzip pb.zip \
 && rm pb.zip

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
