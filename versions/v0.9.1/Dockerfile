FROM node:6

MAINTAINER Christopher Biscardi <chris@christopherbiscardi.com>

ENV PURESCRIPT_DOWNLOAD_SHA1 9e8ff98e1e5d0dbf34df5124dc42d3b73e9dc257

RUN cd /opt \
    && wget https://github.com/purescript/purescript/releases/download/v0.9.1/linux64.tar.gz \
    && echo "$PURESCRIPT_DOWNLOAD_SHA1 linux64.tar.gz" | sha1sum -c - \
    && tar -xvf linux64.tar.gz \
    && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

RUN cd /tmp \
    && npm install -g bower pulp \
    && pulp init 2> /dev/null || true \
    && bower install purescript-psci-support --allow-root --save-dev

CMD cd /tmp && pulp psci
