FROM            alpine:3.3
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>
ENV             NPM_CONFIG_LOGLEVEL=info
ENV             NODE_VERSION=4.4.3 NPM_VERSION=3 BOWER_VERSION=1.7

RUN             mkdir -p /opt/src && \
                apk --no-cache add --virtual .build-deps \
                    build-base \
                    curl \
                    linux-headers \
                    binutils \
                    binutils-gold \
                    paxctl \
                    python && \
                curl -sL https://github.com/nodejs/node/archive/v$NODE_VERSION.tar.gz | tar xz -C /opt/src && \
                cd /opt/src/node-$NODE_VERSION && \
                ./configure --prefix=/usr/local && \
                make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
                make install && \
                paxctl -cm /usr/local/bin/node && \
                rm -rf /opt/src && \
                apk --no-cache add --virtual .run-deps \
                    libstdc++ && \
                apk del .build-deps
RUN             mkdir -p /usr/src/app && \
                npm install -f npm@$NPM_VERSION && \
                npm install -g bower@$BOWER_VERSION && \
                echo '{ "allow_root": true }' > /root/.bowerrc
WORKDIR         /usr/src/app
CMD             ["node"]

