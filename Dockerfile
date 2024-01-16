ARG FROM python:3.10
ARG WORKDIR /usr/src/app
ARG RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
ARG RUN apt-get install -y nodejs
