FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /esbc

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} esbc
RUN useradd -u ${USER_ID} -g esbc -s /bin/bash -m -d /esbc esbc

RUN chown esbc:esbc -R /esbc

ADD https://github.com/BlockchainFor/ESBC2/releases/download/2.1.0.2/esbc-daemon-linux-x86_64-static.tar.gz /tmp/
RUN tar -xvf /tmp/esbc*.tar.gz -C /esbc/
RUN cp /esbc/*  /usr/local/bin
RUN rm -rf /tmp/esbc*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER esbc

VOLUME ["/esbc"]

EXPOSE 9998 9999 19998 19999 1360

WORKDIR /esbc

CMD ["oneshot"]
