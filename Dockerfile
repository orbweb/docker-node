FROM            alpine:3.3
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>
ENV             NPM_CONFIG_LOGLEVEL=info
ENV             NODE_VERSION=4.2.2

COPY            src/node /opt/src/node
RUN             cd /opt/src/node && \
                apk --no-cache add --virtual .build-deps \
                    build-base \
                    linux-headers \
                    binutils \
                    binutils-gold \
                    paxctl \
                    python && \
                ./configure --prefix=/usr/local && \
                make && \
                make install && \
                paxctl -cm /usr/local/bin/node && \
                rm -rf /opt/src && \
                apk --no-cache add --virtual .run-deps \
                    libstdc++ && \
                apk del .build-deps
RUN             mkdir -p /usr/src/app && \
                npm install -g bower && \
                echo '{ "allow_root": true }' > /root/.bowerrc && \
                apk --no-cache add --virtual .build-deps \
                    git
WORKDIR         /usr/src/app
CMD             ["node"]
