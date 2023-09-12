FROM cubetiq/calpine-node:slim
LABEL maintainer="sombochea@cubetiqs.com"

# Install PNPM
RUN npm install -g pnpm@latest

# Update NPM package
RUN npm install -g npm@latest

# Install yarn from npm package
RUN npm install -g yarn@latest --force

# Checking packages version
RUN echo "NODE: $(node --version)" \
  && echo "NPM: $(npm --version)" \
  && echo "NPX: $(npx --version)" \
  && echo "YARN: $(yarn --version)" \
  && echo "PNPM: $(pnpm --version)"

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD [ "node" ]
