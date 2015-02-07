FROM node:0.10.35

MAINTAINER Christopher Biscardi <chris@christopherbiscardi.com>

RUN apt-get update && apt-get install wget -y

RUN cd /opt && wget https://github.com/purescript/purescript/releases/download/v0.6.0/linux64.tar.gz

RUN cd /opt && tar -xvf linux64.tar.gz
RUN rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

RUN npm install -g bower pulp

CMD ["/opt/purescript/psci"]
