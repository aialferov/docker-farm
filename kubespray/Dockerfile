FROM alpine

RUN apk --update --no-cache add \
        git \
        make \
        g++ \
        openssl-dev \
        libffi-dev \
        python-dev \
        python \
        py-pip && \
    pip install --upgrade pip && \
    git clone -b v2.5.0 https://github.com/kubernetes-incubator/kubespray && \
    pip install -r kubespray/requirements.txt && \
    apk del \
        git \
        make \
        g++ \
        openssl-dev \
        libffi-dev \
        python-dev

WORKDIR /kubespray
ENTRYPOINT ["ansible-playbook"]
