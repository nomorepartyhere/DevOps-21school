FROM nginx:latest
USER root
COPY /nginx/nginx.conf /etc/nginx/
WORKDIR /home/
RUN touch /var/run/nginx.pid ; \
    chown -R nginx:nginx /var/run/nginx.pid ;