FROM node:16-alpine

WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY package*.json /usr/src/app/
RUN yarn

COPY . /usr/src/app

ENV PORT 3000
EXPOSE $PORT
CMD [ "yarn", "start" ]
