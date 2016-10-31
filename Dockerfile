FROM mhart/alpine-node:6
MAINTAINER Robert O\'Rourke "rob@o-rourke.org"

# The repo to clone in the format `user/repo`
ENV GIT_REPO null
# The auth token to use
ENV GIT_TOKEN null

RUN apk add --update --no-cache build-base git openssh

RUN mkdir /var/app
WORKDIR /var/app

EXPOSE 3000
CMD git init && \
  git pull https://${GIT_TOKEN}@github.com/${GIT_REPO}.git && \
  git submodule update --init --recursive && \
  npm install && \
  PORT=3000 npm start
