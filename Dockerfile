FROM alpine:3.4
MAINTAINER Teruyuki Kobayashi <koba1014@gmail.com>

ENV HUGO_VERSION 0.16
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

RUN apk update && apk upgrade && apk add --no-cache py-pygments git openssh openssh-client

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tgz /tmp/

RUN  tar -xvzf /tmp/${HUGO_BINARY}.tgz -C /tmp/ \
	&& mv /tmp/hugo /usr/bin/hugo && rm -rf /tmp/*
