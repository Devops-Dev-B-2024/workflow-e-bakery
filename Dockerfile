FROM node:18-alpine

WORKDIR /home/node/app

COPY ./ ./

RUN npm install

EXPOSE 8000

CMD ["node", "server.js"]
