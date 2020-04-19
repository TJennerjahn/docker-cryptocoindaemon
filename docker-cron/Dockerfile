FROM ubuntu:18.04

# Install cron
RUN apt update && apt install -y cron curl git
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs -y

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /run.sh /entrypoint.sh

ADD https://github.com/PIVX-Project/PIVX/releases/download/v4.0.2/pivx-4.0.2-x86_64-linux-gnu.tar.gz /tmp/
RUN tar -xvf /tmp/pivx-*.tar.gz -C /tmp/
RUN cp /tmp/pivx*/bin/*  /usr/bin
RUN rm -rf /tmp/pivx*

RUN git clone https://TJennerjahn:TestPleaseIgnore1@github.com/TJennerjahn/my-indexer.git
WORKDIR /my-indexer
RUN npm install

WORKDIR  /
ENTRYPOINT /entrypoint.sh