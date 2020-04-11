FROM ubuntu

ARG USER_ID
ARG GROUP_ID

ENV HOME /energi

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} energi
RUN useradd -u ${USER_ID} -g energi -s /bin/bash -m -d /energi energi

RUN chown energi:energi -R /energi

ADD https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi/v2.4.1/energicore-2.4.1-linux.tar.gz /tmp/
RUN tar -xvf /tmp/energi*.tar.gz -C /tmp/
RUN cp /tmp/energi*/bin/*  /usr/local/bin
RUN rm -rf /tmp/energi*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

RUN apt-get update
# RUN apt-get install libstdc++6 --yes
# RUN apt-get install libc6 --yes

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER energi

VOLUME ["/energi"]

EXPOSE 9998 9999 19998 9797 1355

WORKDIR /energi

CMD ["oneshot"]
