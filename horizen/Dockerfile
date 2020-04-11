FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /horizen

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} horizen
RUN useradd -u ${USER_ID} -g horizen -s /bin/bash -m -d /horizen horizen

RUN chown horizen:horizen -R /horizen

ADD https://github.com/ZencashOfficial/zen/releases/download/v2.0.20/zen-2.0.20-amd64.deb /tmp/

RUN apt-get update
RUN apt-get install libc6 libgcc1 libgomp1 libstdc++6 --yes

RUN dpkg -i /tmp/zen-2.0.20-amd64.deb
# RUN cp /tmp/horizen*/bin/*  /usr/local/bin
RUN rm /tmp/zen-2.0.20-amd64.deb

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER horizen

VOLUME ["/horizen"]

EXPOSE 9998 9999 19998 19999 1357

WORKDIR /horizen

CMD ["oneshot"]
