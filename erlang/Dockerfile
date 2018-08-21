FROM alpine

ARG ERLANG_VERSION=21.0.5
ARG GIT_URL=https://github.com/erlang/otp

RUN apk add --no-cache --update ncurses openssl git make && \
    apk add --no-cache --virtual .build-deps \
        g++ \
        dpkg \
        dpkg-dev \
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
    apk del .build-deps

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    install rebar3 /usr/local/bin && \
    rm rebar3
