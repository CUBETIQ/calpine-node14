# CUBETIQ Alpine OS Linux with Nodejs 16

![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/cubetiq/calpine-node)
![Docker Pulls](https://img.shields.io/docker/pulls/cubetiq/calpine-node)

-   CUBETIQ Alpine OS Linux (Latest)
-   Nodejs 16 (16.17.1)
-   PNPM 7 (7.16.1)

# [Docker Hub](https://hub.docker.com/r/cubetiq/calpine-node)

```shell
docker push cubetiq/calpine-node:latest
```

# Usage

```shell
docker run --rm -it cubetiq/calpine-node:latest /bin/sh
```

# Example

```Dockerfile
FROM cubetiq/calpine-node:latest
LABEL maintainer="sombochea@cubetiqs.com"

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pnpm install

CMD [ "node" , "index.js"]
```

# Contributors

-   Sambo Chea <sombochea@cubetiqs.com>

# License

```text
MIT License

Copyright (c) 2018-2020 Dave Hall <skwashd@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECT
```
