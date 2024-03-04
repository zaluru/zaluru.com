FROM docker.io/library/node:21-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm@8.15.3

RUN pnpm install

COPY . .

EXPOSE 3000

CMD [ "pnpx", "astro", "dev", "--host"]
