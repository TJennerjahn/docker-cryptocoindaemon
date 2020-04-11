FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /bitcoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} bitcoin
RUN useradd -u ${USER_ID} -g bitcoin -s /bin/bash -m -d /bitcoin bitcoin

RUN chown bitcoin:bitcoin -R /bitcoin

ADD https://bitcoincore.org/bin/bitcoin-core-0.19.1/bitcoin-0.19.1-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/bitcoin*.tar.gz -C /tmp/
RUN cp /tmp/bitcoin*/bin/*  /usr/local/bin
RUN rm -rf /tmp/bitcoin*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER bitcoin

VOLUME ["/bitcoin"]

EXPOSE 9998 9999 19998 19999 1354

WORKDIR /bitcoin

CMD ["oneshot"]
