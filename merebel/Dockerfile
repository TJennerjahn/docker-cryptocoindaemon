FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /merebel

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} merebel
RUN useradd -u ${USER_ID} -g merebel -s /bin/bash -m -d /merebel merebel

RUN chown merebel:merebel -R /merebel

ADD https://github.com/ElCrebel/Merebel/releases/download/MERI-v3.5/Merebel-3.5-linux.tar.gz /tmp/merebel/
RUN tar -xvf /tmp/merebel/Merebel-*.tar.gz -C /tmp/merebel/
RUN cp /tmp/merebel/Merebel*  /usr/local/bin
RUN rm -rf /tmp/merebel/

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER merebel

VOLUME ["/merebel"]

EXPOSE 9998 9999 19998 19999 1344

WORKDIR /merebel

CMD ["oneshot"]
