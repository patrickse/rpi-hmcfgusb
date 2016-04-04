# HMCFGUSB
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
#FROM hypriot/rpi-alpine-scratch:v3.2
FROM alpine:3.2
MAINTAINER Patrick Sernetz <patrick@sernetz.com>

ARG HMCFGUSB_VERSION=0.102

RUN mkdir /opt \
  && wget http://git.zerfleddert.de/hmcfgusb/releases/hmcfgusb-$HMCFGUSB_VERSION.tar.gz -P /tmp \
  && apk add --update build-base libusb libusb-dev && rm -rf /var/cache/apk/* \
  && tar -xzf /tmp/hmcfgusb-$HMCFGUSB_VERSION.tar.gz -C /opt \
  && rm /tmp/hmcfgusb-$HMCFGUSB_VERSION.tar.gz \
  && cd /opt/hmcfgusb-$HMCFGUSB_VERSION \
  && ln -s /opt/hmcfgusb-$HMCFGUSB_VERSION /opt/hmcfgusb \
  && make \
  && rm *.h *.o *.c *.d \
  && apk del build-base libusb-dev  
  
EXPOSE 1234

WORKDIR /opt/hmcfgusb

CMD ["/opt/hmcfgusb/hmland", "-v"]
