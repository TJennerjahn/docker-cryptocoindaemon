FROM ubuntu

ARG USER_ID
ARG GROUP_ID

ENV HOME /zenzo

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} zenzo
RUN useradd -u ${USER_ID} -g zenzo -s /bin/bash -m -d /zenzo zenzo

RUN chown zenzo:zenzo -R /zenzo

ADD https://github.com/ZENZO-Ecosystem/ZENZO-Core/releases/download/v1.2.1/zenzo-linux64.tar.gz /tmp/
RUN tar -xvf /tmp/zenzo*.tar.gz -C /tmp/
RUN cp /tmp/zenzo*/bin/*  /usr/local/bin
RUN rm -rf /tmp/zenzo*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER zenzo

VOLUME ["/zenzo"]

EXPOSE 9998 9999 19998 19999 1361 26210

WORKDIR /zenzo

CMD ["oneshot"]
