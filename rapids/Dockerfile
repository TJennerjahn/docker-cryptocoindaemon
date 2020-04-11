FROM ubuntu:xenial

ARG USER_ID
ARG GROUP_ID

ENV HOME /rapids

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} rapids
RUN useradd -u ${USER_ID} -g rapids -s /bin/bash -m -d /rapids rapids

RUN chown rapids:rapids -R /rapids

ADD https://github.com/RapidsOfficial/Rapids/releases/download/v1.0.0.1/rapids-linux-64.tar.gz /tmp/
RUN tar -xvf /tmp/rapids*.tar.gz -C /rapids/
RUN cp /rapids/rapids*  /usr/local/bin
RUN rm -rf /tmp/rapids*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

RUN apt-get update
RUN apt-get install libzmq3-dev --yes
RUN apt-get install libboost-system1.58.0 --yes
RUN apt-get install libboost-all-dev --yes
RUN apt-get install software-properties-common python-software-properties --yes
RUN add-apt-repository ppa:bitcoin/bitcoin --yes
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev --yes
RUN apt-get install libminiupnpc-dev --yes
RUN apt-get install libevent-dev --yes

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER rapids

VOLUME ["/rapids"]

EXPOSE 9998 9999 19998 19999 1361

WORKDIR /rapids

CMD ["oneshot"]
