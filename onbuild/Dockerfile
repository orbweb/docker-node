FROM            orbweb/node:4.2.2
MAINTAINER      Orbweb Inc. <engineering@orbweb.com>

ONBUILD COPY    package.json /usr/src/app/
ONBUILD COPY    bower.json /usr/src/app/
ONBUILD RUN     npm install && \
                bower install && \
                apk del .build-deps
ONBUILD COPY    . /usr/src/app
