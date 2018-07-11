FROM alpine:edge

RUN apk --update add erlang && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["epmd"]
