FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /zcoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} zcoin
RUN useradd -u ${USER_ID} -g zcoin -s /bin/bash -m -d /zcoin zcoin

RUN chown zcoin:zcoin -R /zcoin

ADD https://github.com/zcoinofficial/zcoin/releases/download/v0.13.8.10/zcoin-0.13.8.10-linux64.tar.gz /tmp/
RUN tar -xvf /tmp/zcoin-*.tar.gz -C /tmp/
RUN cp /tmp/zcoin*/bin/*  /usr/local/bin
RUN rm -rf /tmp/zcoin*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER zcoin

VOLUME ["/zcoin"]

EXPOSE 9998 9999 19998 19999 1345

WORKDIR /zcoin

CMD ["oneshot"]
