FROM alpine

RUN apk --update add \
        git \
        make \
        autoconf \
        ncurses-dev \
        openssl-dev \
        g++

RUN wget http://erlang.org/download/otp_src_21.0.tar.gz
RUN tar xf otp_src_21.0.tar.gz

RUN cd otp_src_21.0 && \
    ./configure && \
    make -j && \
    make install
