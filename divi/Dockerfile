FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /divi

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} divi
RUN useradd -u ${USER_ID} -g divi -s /bin/bash -m -d /divi divi

RUN chown divi:divi -R /divi

ADD https://divi-blockchain.ams3.cdn.digitaloceanspaces.com/releases/1.0.8/divi_ubuntu.zip /tmp/
RUN apt-get update
RUN apt-get install unzip --yes
RUN unzip /tmp/divi_ubuntu.zip
RUN cp divi_ubuntu/*  /usr/local/bin
RUN rm -rf /tmp/divi*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER divi

VOLUME ["/divi"]

EXPOSE 9998 9999 19998 19999 1349

WORKDIR /divi

CMD ["oneshot"]
