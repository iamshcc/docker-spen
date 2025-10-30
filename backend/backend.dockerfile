FROM node:22-alpine

WORKDIR /server

# Add curl for network check (optional)
RUN apt install -y curl

# Set a reliable npm registry mirror
RUN npm config set registry https://registry.npmmirror.com

COPY package*.json ./

# Retry install in case of temporary network fail
RUN npm install || npm install --network-timeout=600000

COPY . .

EXPOSE 5000
CMD ["npm", "start"]
