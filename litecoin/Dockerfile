FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /litecoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} litecoin
RUN useradd -u ${USER_ID} -g litecoin -s /bin/bash -m -d /litecoin litecoin

RUN chown litecoin:litecoin -R /litecoin

ADD https://download.litecoin.org/litecoin-0.16.3/linux/litecoin-0.16.3-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/litecoin-*.tar.gz -C /tmp/
RUN cp /tmp/litecoin*/bin/*  /usr/local/bin
RUN rm -rf /tmp/litecoin*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER litecoin

VOLUME ["/litecoin"]

EXPOSE 9998 9999 19998 19999 1343

WORKDIR /litecoin

CMD ["oneshot"]
