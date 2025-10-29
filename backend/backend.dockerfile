FROM node:22-alpine

WORKDIR /server

COPY package*.json ./

RUN npm ci

COPY . .

RUN npx prisma generate

EXPOSE 5000

CMD ["npm", "run", "start"]
