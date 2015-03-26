FROM node:0.10

MAINTAINER Christopher Biscardi <chris@christopherbiscardi.com>

ENV PURESCRIPT_DOWNLOAD_SHA1 c56b1ea11dd00c502220d585e9cb970e1f531b4e

RUN cd /opt \
    && wget https://github.com/purescript/purescript/releases/download/v0.6.6/linux64.tar.gz \
    && echo "$PURESCRIPT_DOWNLOAD_SHA1 linux64.tar.gz" | sha1sum -c - \
    && tar -xvf linux64.tar.gz \
    && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

RUN npm install -g bower pulp

CMD ["/opt/purescript/psci"]
