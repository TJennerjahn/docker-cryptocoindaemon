FROM ubuntu

ARG USER_ID
ARG GROUP_ID

ENV HOME /snowgem

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} snowgem
RUN useradd -u ${USER_ID} -g snowgem -s /bin/bash -m -d /snowgem snowgem

RUN chown snowgem:snowgem -R /snowgem


RUN apt-get update
RUN apt-get install unzip --yes
RUN apt-get install libgomp1 --yes
RUN apt-get install wget curl git --yes

ADD https://github.com/Snowgem/Snowgem/releases/download/v3000457-20190909/snowgem-ubuntu16.04-3000457-20190926.zip /tmp/

RUN unzip /tmp/snowgem-ubuntu16.04-3000457-20190926.zip -d snowgem/

RUN cp snowgem/*  /usr/local/bin

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER snowgem

VOLUME ["/snowgem"]

EXPOSE 9998 9999 19998 19999 1358

WORKDIR /snowgem

CMD ["oneshot"]
