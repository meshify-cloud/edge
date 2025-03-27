FROM nginx:stable-alpine
COPY ./nginx.conf.template /nginx.conf.template
COPY ./secure_link.conf.template /secure_link.conf.template
COPY ./entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/entrypoint.sh

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
