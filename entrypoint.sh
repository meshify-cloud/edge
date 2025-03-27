#!/bin/sh
set -e

envsubst '${ORIGIN}' < /nginx.conf.template > /etc/nginx/conf.d/default.conf

envsubst '${VALID_REFERERS}' < /valid_referers.conf.template > /etc/nginx/valid_referers.conf

if [ -z "$VALID_REFERERS" ]; then
    echo "# valid_referers 未启用" > /etc/nginx/valid_referers.conf
fi

envsubst '${SECURE_LINK_SECRET}' < /secure_link.conf.template > /etc/nginx/secure_link.conf

if [ -z "$SECURE_LINK_SECRET" ]; then
    echo "# secure_link 未启用" > /etc/nginx/secure_link.conf
fi

exec "$@"
