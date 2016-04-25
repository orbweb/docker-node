FROM            orbweb/node:4.4.3
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>

ENV             BOWER_VERSION=1.7

RUN             npm install -g bower@$BOWER_VERSION && \
                echo '{ "allow_root": true }' > /root/.bowerrc

ONBUILD COPY    package.json /usr/src/app/
ONBUILD COPY    bower.json /usr/src/app/
ONBUILD RUN     npm install && \
                bower install
ONBUILD COPY    . /usr/src/app
