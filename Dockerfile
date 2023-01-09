FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy wget && \
    rm -rf /var/cache/apk/*

ADD app.sh /app.sh
RUN chmod +x /app.sh

CMD /app.sh
