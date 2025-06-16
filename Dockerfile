# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
# 'source' 'destination'
COPY . .
RUN npm install --production

EXPOSE 3000 

CMD ["npm", "start"]