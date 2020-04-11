FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /wagerr

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} wagerr
RUN useradd -u ${USER_ID} -g wagerr -s /bin/bash -m -d /wagerr wagerr

RUN chown wagerr:wagerr -R /wagerr

ADD https://github.com/wagerr/wagerr/releases/download/v3.1.0/wagerr-3.1.0-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/wagerr*.tar.gz -C /tmp/
RUN cp /tmp/wagerr*/bin/*  /usr/local/bin
RUN rm -rf /tmp/wagerr*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER wagerr

VOLUME ["/wagerr"]

EXPOSE 9998 9999 19998 19999 1356

WORKDIR /wagerr

CMD ["oneshot"]
