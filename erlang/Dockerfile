FROM alpine:3.8

ARG ERLANG_VERSION=21.0.3
ARG GIT_URL=https://github.com/erlang/otp

RUN apk upgrade --update --no-cache && \
    apk add --no-cache ncurses openssl && \
    apk add --no-cache --virtual .erlang-build-deps \
        git \
        g++ \
        dpkg \
        dpkg-dev \
        make \
        autoconf \
        ncurses-dev \
        openssl-dev && \
    git clone -b OTP-$ERLANG_VERSION \
              --single-branch \
              --depth 1 \
              $GIT_URL && \
    cd otp && \
    export CFLAGS="-s -O3" && \
    export CXXFLAGS="-s -O3" && \
    ./otp_build autoconf && \
    ./configure \
        --build="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        --without-et \
        --without-gs \
        --without-ic \
        --without-wx \
        --without-odbc \
        --without-javac \
        --without-orber \
        --without-typer \
        --without-megaco \
        --without-percept \
        --without-debugger \
        --without-observer \
        --without-jinterface \
        --without-cosTime \
        --without-cosEvent \
        --without-cosProperty \
        --without-cosEventDomain \
        --without-cosFileTransfer \
        --without-cosNotification \
        --without-cosTransactions && \
    make -j && \
    make install && \
    cd ../ && \
    rm -rf otp && \
    apk del .erlang-build-deps
