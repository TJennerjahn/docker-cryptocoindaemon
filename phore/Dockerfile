FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /phore

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} phore
RUN useradd -u ${USER_ID} -g phore -s /bin/bash -m -d /phore phore

RUN chown phore:phore -R /phore

ADD https://github.com/phoreproject/Phore/releases/download/v1.6.3/phore-1.6.3-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/phore-*.tar.gz -C /tmp/
RUN cp /tmp/phore-*/bin/*  /usr/local/bin
RUN rm -rf /tmp/phore-*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER phore

VOLUME ["/phore"]

EXPOSE 9998 9999 19998 19999 1352

WORKDIR /phore

CMD ["oneshot"]
