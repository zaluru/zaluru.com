FROM docker.io/library/node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npx", "astro", "dev", "--host"]