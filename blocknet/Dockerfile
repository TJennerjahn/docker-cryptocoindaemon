FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /blocknet

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} blocknet
RUN useradd -u ${USER_ID} -g blocknet -s /bin/bash -m -d /blocknet blocknet

RUN chown blocknet:blocknet -R /blocknet

ADD https://github.com/blocknetdx/blocknet/releases/download/v4.1.0/blocknet-4.1.0-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/blocknet-*.tar.gz -C /tmp/
RUN cp /tmp/blocknet-*/bin/*  /usr/local/bin
RUN rm -rf /tmp/blocknet-*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER blocknet

VOLUME ["/blocknet"]

EXPOSE 9998 9999 19998 19999 1351

WORKDIR /blocknet

CMD ["oneshot"]
