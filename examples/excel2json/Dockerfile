FROM cubetiq/calpine-node:latest
LABEL maintainer="sombochea@cubetiqs.com"

VOLUME [ "/app/data" ]

ENV INPUT_FILE './data/people.xlsx'
ENV OUTPUT_PATH './data/outputs'
ENV MAPPER_FILE './data/mapper.json'

WORKDIR /app

COPY . /app

RUN pnpm install

CMD [ "node" , "index.js"]