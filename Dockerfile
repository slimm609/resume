FROM debian:10-slim
LABEL maintainer="Brian Davis <bdavis001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests texlive-full && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /latex

WORKDIR /latex