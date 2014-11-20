FROM node:0.10.32

RUN apt-get update && apt-get install wget -y

RUN cd /opt && wget https://github.com/purescript/purescript/releases/download/v0.6.1.1/linux64.tar.gz

RUN cd /opt && tar -xvf linux64.tar.gz
RUN rm /opt/linux64.tar.gz

CMD ["/opt/purescript/psci"]