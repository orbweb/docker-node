FROM            orbweb/node:5.11.0
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>

ONBUILD COPY    package.json /usr/src/app/
ONBUILD RUN     npm install && \
                bower install
ONBUILD COPY    . /usr/src/app
