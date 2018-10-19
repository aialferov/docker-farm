FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y \
        git \
        make \
        wget

RUN wget https://dl.google.com/go/go1.8.7.linux-amd64.tar.gz && \
         tar xf go1.8.7.linux-amd64.tar.gz -C /usr/local && \
         rm -f go1.8.7.linux-amd64.tar.gz

ENV PATH=/usr/local/go/bin:${PATH}

RUN git clone \
        git://github.com/IBM-Bluemix/terraform-provider-ibm.git \
        /root/go/src/github.com/terraform-providers/terraform-provider-ibm

RUN cd /root/go/src/github.com/terraform-providers/terraform-provider-ibm && \
    GOOS=darwin GOARCH=amd64 make build
