FROM node:22.21.1-alpine3.21 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN mv svelte.dev.txt svelte.config.js

RUN npm run build

FROM node:22.21.1-alpine3.21 AS runner

WORKDIR /app

COPY --from=builder /app/build ./build
COPY package*.json ./

RUN npm install

EXPOSE 3000

CMD ["node", "build"]
