FROM cubetiq/calpine-node:slim
LABEL maintainer="sombochea@cubetiqs.com"

# Install PNPM
ARG PNPM_VERSION=7.25.0
ENV PNPM_HOME=/root/.local/share/pnpm
ENV PATH=$PATH:$PNPM_HOME

RUN echo "Installing PNPM version: $PNPM_VERSION" && \
  apk add --no-cache curl && \
  curl -fsSL "https://github.com/pnpm/pnpm/releases/download/v${PNPM_VERSION}/pnpm-linuxstatic-x64" -o /bin/pnpm && chmod +x /bin/pnpm && \
  apk del curl

# Install yarn from npm package
RUN npm -g i yarn

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
