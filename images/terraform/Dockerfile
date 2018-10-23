FROM alpine

LABEL PROJECT=terraform
ARG VERSION=0.11.9

ARG ARCHIVE=terraform\_$VERSION\_linux_amd64.zip

RUN apk upgrade --no-cache --update && \
    apk add --no-cache ca-certificates && \
    wget https://releases.hashicorp.com/terraform/$VERSION/$ARCHIVE && \
    unzip $ARCHIVE -d /usr/local/bin && \
    rm $ARCHIVE

WORKDIR /tf

ENTRYPOINT ["terraform"]
