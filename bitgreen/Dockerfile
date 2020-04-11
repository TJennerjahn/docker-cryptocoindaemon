FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /bitgreen

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} bitgreen
RUN useradd -u ${USER_ID} -g bitgreen -s /bin/bash -m -d /bitgreen bitgreen

RUN chown bitgreen:bitgreen -R /bitgreen

ADD https://github.com/bitgreen/bitgreen/releases/download/v1.4.0.8/bitgreen-1.4.0.8-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/bitgreen-*.tar.gz -C /tmp/
RUN cp /tmp/bitgreen*/bin/*  /usr/local/bin
RUN rm -rf /tmp/bitgreen*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER bitgreen

VOLUME ["/bitgreen"]

EXPOSE 9998 9999 19998 19999 1338

WORKDIR /bitgreen

CMD ["oneshot"]
