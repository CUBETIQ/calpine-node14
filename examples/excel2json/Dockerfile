FROM cubetiq/calpine-node:latest
LABEL maintainer="sombochea@cubetiqs.com"

ENV INPUT_FILE './data/people.xlsx'
ENV OUTPUT_PATH './data/outputs'
ENV MAPPER_FILE './data/mapper.json'

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN yarn

CMD [ "node" , "index.js"]