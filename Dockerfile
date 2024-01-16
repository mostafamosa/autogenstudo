ARG FROM python:3.10
WORKDIR /usr/src/app
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
