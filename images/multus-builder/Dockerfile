FROM ubuntu

RUN apt-get update && \
    apt-get install \
        git \
        wget -y && \
    wget https://dl.google.com/go/go1.8.7.linux-amd64.tar.gz && \
         tar xf go1.8.7.linux-amd64.tar.gz -C /usr/local && \
         rm -f go1.8.7.linux-amd64.tar.gz

ENV PATH=/usr/local/go/bin:${PATH}

RUN git clone \
        https://github.com/Intel-Corp/multus-cni \
        /root/go/github.com/Intel-Corp/multus-cni

RUN cd /root/go/github.com/Intel-Corp/multus-cni && \
    ./build

CMD /mnt/crio/usr/local/libexec/crio/pause
