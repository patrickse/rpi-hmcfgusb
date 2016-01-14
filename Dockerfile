# HMCFGUSB
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV HMCFGUSB_VERSION latest

RUN apt-get -y update \
  #&& apt-get -y upgrade \
  && apt-get -y install libusb-1.0-0-dev build-essential git wget tar


#RUN mkdir /opt/hmland \
#  && git clone git://git.zerfleddert.de/hmcfgusb \
#  && cd hmcfgusb
#  && make

RUN mkdir /opt/hmland \
  && cd /opt/hmland \
  && wget https://git.zerfleddert.de/hmcfgusb/releases/hmcfgusb-0.102.tar.gz \
  && tar xzf hmcfgusb-0.102.tar.gz \
  && cp -R hmcfgusb-0.102/* . \
  && make

EXPOSE 1234

#CMD ["/opt/hmland/hmland", "-p 1234", "-D"]
CMD ["/opt/hmland/hmland", "-v"]
