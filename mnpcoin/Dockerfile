FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /mnpcoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} mnpcoin
RUN useradd -u ${USER_ID} -g mnpcoin -s /bin/bash -m -d /mnpcoin mnpcoin

RUN chown mnpcoin:mnpcoin -R /mnpcoin

ADD https://github.com/MasterNodesPro/MNPCoin/releases/download/v1.2.5/mnpcoin-v1.2.5.tar.gz /tmp/
RUN tar -xvf /tmp/mnpcoin-*.tar.gz -C /tmp/
RUN cp /tmp/mnpcoin*  /usr/local/bin
RUN rm -rf /tmp/mnpcoin*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

RUN apt-get update
# RUN apt-get install curl g++-aarch64-linux-gnu g++-4.8-aarch64-linux-gnu gcc-4.8-aarch64-linux-gnu binutils-aarch64-linux-gnu g++-arm-linux-gnueabihf g++-4.8-arm-linux-gnueabihf gcc-4.8-arm-linux-gnueabihf binutils-arm-linux-gnueabihf g++-4.8-multilib gcc-4.8-multilib binutils-gold bsdmainutils --yes
RUN apt-get install libzmq3-dev --yes
RUN apt-get install libboost-all-dev --yes
RUN apt-get install software-properties-common python-software-properties --yes
RUN add-apt-repository ppa:bitcoin/bitcoin --yes
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev --yes
RUN apt-get install libevent-dev --yes

USER mnpcoin

VOLUME ["/mnpcoin"]

EXPOSE 9998 9999 19998 19999 1350

WORKDIR /mnpcoin

CMD ["oneshot"]
