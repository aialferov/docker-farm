FROM alpine:3.8

RUN apk upgrade --no-cache --update && \
    apk add --no-cache \
        git \
        vim \
        make \
        erlang \
        erlang-dev \
        erlang-ssl \
        erlang-asn1 \
        erlang-inets \
        erlang-eunit \
        erlang-tools \
        erlang-crypto \
        erlang-public-key \
        erlang-syntax-tools && \
    wget https://s3.amazonaws.com/rebar3/rebar3 && \
    install rebar3 /usr/local/bin && \
    ln -s /usr/local/bin/rebar3 /usr/local/bin/r3 && \
    rm rebar3 && \
    git clone https://github.com/aialferov/r3tmpl $HOME/.config/rebar3
