FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

ENV HOME /safeinsure

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} safeinsure
RUN useradd -u ${USER_ID} -g safeinsure -s /bin/bash -m -d /safeinsure safeinsure

RUN chown safeinsure:safeinsure -R /safeinsure

ADD https://github.com/SafeInsure/sins-coin/releases/download/v1.0.0.11/safeinsure-1.0.0-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/safeinsure-*.tar.gz -C /tmp/
RUN cp /tmp/SafeInsure*/*  /usr/local/bin
RUN rm -rf /tmp/safeinsure*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 14.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER safeinsure

VOLUME ["/safeinsure"]

EXPOSE 9998 9999 19998 19999 1341

WORKDIR /safeinsure

CMD ["oneshot"]
