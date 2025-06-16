# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app

# Paired with '.dockerignore' we don't run the risk of moving local (possibly incompatible) modules
COPY package-lock.json .
COPY package.json .
RUN npm install --production

COPY . .

EXPOSE 3000 

CMD ["npm", "start"]