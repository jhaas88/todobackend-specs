FROM ubuntu:bionic
MAINTAINER Jan Haas


ENV TERM=xterm-256color


#Install node.js
RUN apt-get update && \
	apt-get -y install curl gnupg && \
	curl -sL https://deb.nodesource.com/setup_11.x  | bash - && \
	apt-get -y install nodejs


COPY . /app
WORKDIR /app


#Install application dependencies
RUN npm install -g mocha && \
	npm install


#Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
