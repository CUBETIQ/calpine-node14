FROM cubetiq/calpine-node:latest
LABEL maintainer="sombochea@cubetiqs.com"

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN yarn

CMD [ "node" , "index.js"]