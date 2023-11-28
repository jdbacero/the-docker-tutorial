FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user laravel/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}




############################
# FROM node:latest

# WORKDIR /home/server

# RUN npm install -g json-server

# COPY db.json /home/server/db.json

# COPY alt.json /home/server/alt.json

# EXPOSE 3000

# ENTRYPOINT ["json-server", "--host", "0.0.0.0"]

# CMD ["db.json"]