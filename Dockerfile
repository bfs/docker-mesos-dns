FROM boritzio/docker-base

RUN apt-get update; apt-get install -y git-core build-essential

RUN curl -O https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz

ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH /build


RUN go get github.com/tools/godep && \
    cd $GOPATH/src/github.com/tools/godep && \
    go build -o godep && \
    cp godep /bin/

ENV MESOS_DNS_PATH=$GOPATH/src/github.com/mesosphere/mesos-dns

RUN mkdir -p $MESOS_DNS_PATH && \
    cd $MESOS_DNS_PATH && \
    git clone git://github.com/mesosphere/mesos-dns . && \
    make all && \
    cp mesos-dns / && \
    rm -rf $GOPATH

EXPOSE 8053 8053/udp 8123

VOLUME ["/config"]

ADD start.sh /etc/my_init.d/


