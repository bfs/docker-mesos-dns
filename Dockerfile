FROM boritzio/docker-base

ADD https://github.com/mesosphere/mesos-dns/releases/download/v0.5.2/mesos-dns-v0.5.2-linux-amd64 mesos-dns

RUN chmod +x mesos-dns

EXPOSE 8053 8053/udp 8123

VOLUME ["/config"]

ADD start.sh /etc/my_init.d/


