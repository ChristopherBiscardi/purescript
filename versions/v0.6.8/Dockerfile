FROM node:0.10

MAINTAINER Christopher Biscardi <chris@christopherbiscardi.com>

RUN cd /opt && wget https://github.com/purescript/purescript/releases/download/v0.6.8/linux64.tar.gz && tar -xvf linux64.tar.gz && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

RUN npm install -g bower pulp

CMD ["/opt/purescript/psci"]
