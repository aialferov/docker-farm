FROM alpine:edge

RUN apk --update add erlang \
                     erlang-ssl \
                     erlang-asn1 \
                     erlang-inets \
                     erlang-xmerl \
                     erlang-crypto \
                     erlang-common-test \
                     erlang-public-key && \
    rm -rf /var/cache/apk/*
