FROM nginx:stable-alpine
COPY ./nginx.conf.template /nginx.conf.template
COPY ./secure_link.conf.template /secure_link.conf.template
COPY entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/entrypoint.sh

EXPOSE 80
CMD ["/bin/sh" , "-c" , "envsubst '${VALID_REFERERS} ${ORIGIN}' < /nginx.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
