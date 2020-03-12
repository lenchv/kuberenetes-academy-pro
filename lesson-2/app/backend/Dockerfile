FROM node:13

RUN mkdir -p /app

WORKDIR /app

COPY ./src /app

RUN npm ci

CMD npm run start
