FROM docker.io/library/node:21-alpine

WORKDIR /app

COPY package*.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install

COPY . .

EXPOSE 3000

CMD [ "pnpx", "astro", "dev", "--host"]
