FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /birakecoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} birakecoin
RUN useradd -u ${USER_ID} -g birakecoin -s /bin/bash -m -d /birakecoin birakecoin

RUN chown birakecoin:birakecoin -R /birakecoin

ADD https://github.com/birake/birakecoin/releases/download/v2.0.1.0/birakecoin-2.0.1-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/birakecoin-*.tar.gz -C /tmp/
RUN cp /tmp/birakecoin*/bin/*  /usr/local/bin
RUN rm -rf /tmp/birakecoin*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER birakecoin

VOLUME ["/birakecoin"]

EXPOSE 9998 9999 19998 19999

WORKDIR /birakecoin

CMD ["birakecoin_oneshot"]
