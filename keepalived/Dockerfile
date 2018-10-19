FROM alpine

LABEL PROJECT=keepalived
ARG VERSION=2.0.7

COPY keepalived.patch ./ 

RUN apk upgrade --no-cache --update && \
    apk add --no-cache \
        ipset \
        libnl3 \
        openssl \
        iptables \
        libnfnetlink && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        make \
        musl-dev \
        ipset-dev \
        libnl3-dev \
        openssl-dev \
        iptables-dev \
        libnfnetlink-dev && \
    wget http://www.keepalived.org/software/keepalived-$VERSION.tar.gz && \
    tar zxf keepalived-$VERSION.tar.gz && \
#   patch -p0 < keepalived.patch && \
    cd keepalived-$VERSION && \
    ./configure && \
    make -j4 && \
    make install && \
    cd ../ && \
    rm -rf keepalived-$VERSION && \
    rm keepalived-$VERSION.tar.gz && \
    rm keepalived.patch && \
    apk del .build-deps

ENTRYPOINT ["keepalived"]
