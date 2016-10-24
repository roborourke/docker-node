FROM mhart/alpine-node:6
MAINTAINER Robert O\'Rourke "rob@o-rourke.org"

RUN mkdir /var/app
VOLUME /var/app
WORKDIR /var/app

RUN npm install

EXPOSE 3000
CMD PORT=3000 npm start
