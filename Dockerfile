FROM debian:jessie

LABEL maintainer="pdf<https://github.com/pengdafu>"

COPY sources.list /etc/apt/sources.list
COPY wkhtmltopdf /usr/bin/
COPY fonts /usr/share/fonts
COPY fontconfig /var/cache/fontconfig
ENV PATH=/node/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
   apt-get install xvfb libxrender1 libfontconfig1 libssl-dev git wget -y && \
   apt-get autoclean && apt-get clean && rm -rf /var/lib/apt/lists/* && \
   wget https://nodejs.org/download/release/v10.15.0/node-v10.15.0-linux-x64.tar.gz && \
   tar -xzf node-v10.15.0-linux-x64.tar.gz && mv node-v10.15.0-linux-x64 node && rm node-v10.15.0-linux-x64.tar.gz && \
   chmod 755 /usr/bin/wkhtmltopdf


