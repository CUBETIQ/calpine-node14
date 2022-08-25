FROM cubetiq/calpine-node:latest
LABEL maintainer="sombochea@cubetiqs.com"

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pnpm install

CMD [ "node" , "index.js"]