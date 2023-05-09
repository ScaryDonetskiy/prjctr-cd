FROM node:latest

RUN apt-get update && apt-get install -y --no-install-recommends git unzip libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --chown=1000:1000 .. /var/www/project

WORKDIR /var/www/project

RUN npm install

ENTRYPOINT ["npm", "start"]
