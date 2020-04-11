FROM ubuntu

ARG USER_ID
ARG GROUP_ID

ENV HOME /bitcoin-sv

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} bitcoin-sv
RUN useradd -u ${USER_ID} -g bitcoin-sv -s /bin/bash -m -d /bitcoin-sv bitcoin-sv

RUN chown bitcoin-sv:bitcoin-sv -R /bitcoin-sv

ADD https://download.bitcoinsv.io/bitcoinsv/1.0.2/bitcoin-sv-1.0.2-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/bitcoin-sv*.tar.gz -C /tmp/
RUN cp /tmp/bitcoin-sv*/bin/*  /usr/local/bin
RUN rm -rf /tmp/bitcoin-sv*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER bitcoin-sv

VOLUME ["/bitcoin-sv"]

EXPOSE 9998 9999 19998 19999 1359

WORKDIR /bitcoin-sv

CMD ["oneshot"]
