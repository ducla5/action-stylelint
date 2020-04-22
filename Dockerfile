FROM node:current-alpine

ENV REVIEWDOG_VERSION=v0.9.18

RUN wget -O - -q https://raw.githubusercontent.com/ducla5/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add jq git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
