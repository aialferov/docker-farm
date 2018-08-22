FROM alpine

ARG ERLANG_VERSION=21.0.5
ARG GIT_URL=https://github.com/erlang/otp

RUN apk add --no-cache --update ncurses git make && \
    apk add --no-cache --virtual .build-deps \
        g++ \
        dpkg \
        dpkg-dev \
        autoconf \
        binutils \
        findutils \
        ncurses-dev \
        openssl-dev && \
    git clone -b OTP-$ERLANG_VERSION \
              --single-branch \
              --depth 1 \
              $GIT_URL && \
    cd otp && \
    ./otp_build autoconf && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        "CC=gcc" \
        "CFLAGS=-Os -fomit-frame-pointer" \
        "CPPFLAGS=-Os -fomit-frame-pointer -D_BSD_SOURCE" \
        "CXXFLAGS=-Os -fomit-frame-pointer" \
        "LDFLAGS=-Wl,--as-needed" \
        --build="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        --cache-file=/dev/null \
        --enable-threads \
        --disable-option-checking \
        --disable-dynamic-ssl-lib \
        --with-ssl=/usr \
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
    find /usr/lib/erlang -executable -type f -exec strip "{}" \; && \
    apk del .build-deps

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    install rebar3 /usr/local/bin && \
    rm rebar3
