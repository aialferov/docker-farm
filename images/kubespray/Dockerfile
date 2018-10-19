FROM alpine:3.8

LABEL PROJECT=kubespray
ARG VERSION=2.6.0
ARG GIT_URL=https://github.com/kubernetes-incubator/kubespray

RUN apk upgrade --no-cache --update && \
    apk add --no-cache \
        python \
        openssh \
        sshpass && \
    apk add --no-cache --virtual .build-deps \
        git \
        g++ \
        make \
        py-pip \
        libffi-dev \
        python-dev \
        openssl-dev && \
    pip install --upgrade pip && \
    git clone -b v$VERSION \
              --single-branch \
              --depth 1 \
              $GIT_URL && \
    pip install -r kubespray/requirements.txt && \
    apk del .build-deps

WORKDIR /kubespray

ENTRYPOINT ["ansible-playbook"]
