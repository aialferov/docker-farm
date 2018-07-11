FROM ubuntu

RUN apt-get update && \
    apt-get install -y \
        git \
        wget \
        btrfs-tools \
        libassuan-dev \
        libdevmapper-dev \
        libglib2.0-dev \
        libc6-dev \
        libgpgme11-dev \
        libgpg-error-dev \
        libseccomp-dev \
        libselinux1-dev \
        pkg-config \
        go-md2man \
        runc

RUN wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz && \
         tar xf go1.9.4.linux-amd64.tar.gz -C /usr/local && \
         rm -f go1.9.4.linux-amd64.tar.gz

ENV PATH=/usr/local/go/bin:${PATH}

RUN git clone \
        https://github.com/kubernetes-incubator/cri-o \
        /root/go/github.com/kubernetes-incubator/cri-o && \
    git -C /root/go/github.com/kubernetes-incubator/cri-o checkout release-1.9

RUN cd /root/go/github.com/kubernetes-incubator/cri-o && \
    make install.tools && \
    make && \
    mkdir -p /mnt/crio && \
    make install DESTDIR=/mnt/crio && \
    install -D -m 644 crio.conf /mnt/crio/etc/crio/crio.conf && \
    install -D -m 644 crio-umount.conf /mnt/crio/etc/crio/crio-umount.conf && \
    install -D -m 644 crictl.yaml /mnt/crio/etc/crio/crictl.yaml && \
    install -D -m 644 seccomp.json /mnt/crio/etc/crio/seccomp.json && \
    install -D -m 644 test/policy.json /mnt/crio/etc/containers/policy.json && \
    tar czf /mnt/crio-amd64-v1.9.0.tar.gz -C /mnt/crio .

CMD /mnt/crio/usr/local/libexec/crio/pause
