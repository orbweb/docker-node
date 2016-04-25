FROM            orbweb/node:5.11.0
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>

ENV             BOWER_VERSION=1.7

RUN             apk --no-cache add --virtual .build-deps \
                    git \
                    python && \
                npm install -g bower@$BOWER_VERSION && \
                echo '{ "allow_root": true }' > /root/.bowerrc

ONBUILD COPY    package.json /usr/src/app/
ONBUILD COPY    bower.json /usr/src/app/
ONBUILD RUN     npm install && \
                bower install && \
                apk del .build-deps
ONBUILD COPY    . /usr/src/app
