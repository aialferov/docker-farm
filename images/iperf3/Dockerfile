FROM alpine

LABEL PROJECT=iperf3
ARG VERSION=latest

RUN apk upgrade --no-cache --update && \
    apk add --no-cache iperf3

ENTRYPOINT ["iperf3"]
