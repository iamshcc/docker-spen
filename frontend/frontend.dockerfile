FROM node:22-alpine AS builder

WORKDIR /app

RUN apt install -y curl

RUN npm config set registry https://registry.npmmirror.com

COPY package*.json ./

RUN npm install || npm install --network-timeout=600000

COPY . .
RUN npm run build

FROM node:22-alpine AS runner

WORKDIR /app

COPY --from=builder /app/build ./build
COPY package*.json ./

RUN npm install || npm install --network-timeout=600000

EXPOSE 3000
CMD ["node", "build"]
