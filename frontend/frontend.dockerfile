FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:22-alpine AS runner

WORKDIR /app

COPY --from=builder /app/build ./build
COPY package*.json ./

RUN npm install

EXPOSE 3000

CMD ["node", "build"]
