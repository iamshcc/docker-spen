FROM node:22.21.1-alpine3.21

WORKDIR /server

COPY package*.json ./

RUN npm install

COPY . .

RUN mv .env.example .env

RUN npx prisma generate

EXPOSE 5000

CMD ["npm", "start"]
