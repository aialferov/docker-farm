FROM alpine

ARG ERLANG_VERSION=21.0

RUN apk --update --no-cache add \
        g++ \
        make \
        autoconf \
        ncurses-dev \
        openssl-dev && \
    wget http://erlang.org/download/otp_src_$ERLANG_VERSION.tar.gz && \
    tar xf otp_src_$ERLANG_VERSION.tar.gz && \
    rm otp_src_$ERLANG_VERSION.tar.gz && \
    cd otp_src_$ERLANG_VERSION && \
    export CFLAGS="-O3 -s" && \
    ./configure \
        --without-javac \
        --without-wx \
        --without-jinterface \
        --without-cosEvent\
        --without-cosEventDomain \
        --without-cosFileTransfer \
        --without-cosNotification \
        --without-cosProperty \
        --without-cosTime \
        --without-cosTransactions \
        --without-et \
        --without-gs \
        --without-ic \
        --without-megaco \
        --without-orber \
        --without-percept \
        --without-typer && \
    make -j && \
    make install && \
    cd ../ && \
    rm -rf otp_src_$ERLANG_VERSION && \
    apk del \
        openssl-dev \
        ncurses-dev \
        autoconf \
        make \
        g++ && \
    apk --update --no-cache add \
        ncurses \
        openssl
