FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /syscoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} syscoin
RUN useradd -u ${USER_ID} -g syscoin -s /bin/bash -m -d /syscoin syscoin

RUN chown syscoin:syscoin -R /syscoin

ADD https://github.com/syscoin/syscoin/releases/download/v4.1.3/syscoin-4.1.3-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/syscoin-*.tar.gz -C /tmp/
RUN cp /tmp/syscoin-*/bin/*  /usr/local/bin
RUN rm -rf /tmp/syscoin-*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER syscoin

VOLUME ["/syscoin"]

EXPOSE 9998 9999 19998 19999 1353

WORKDIR /syscoin

CMD ["oneshot"]
