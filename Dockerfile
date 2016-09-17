FROM alpine:3.4
MAINTAINER Teruyuki Kobayashi <koba1014@gmail.com>

ENV HUGO_VERSION 0.16
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-amd64

RUN apk update && apk add py-pygments && rm -rf /var/cache/apk/*

# https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tgz

ADD https://github.com/spf13/hugo/releases/download/v0.16/hugo_0.16_linux-arm64.tgz /tmp/

RUN  tar -xvzf /tmp/${HUGO_BINARY}.tar.gz -C /tmp/ \
	&& mv /tmp/${HUGO_BINARY}/${HUGO_BINARY} /usr/bin/hugo && rm -rf /tmp/hugo*
