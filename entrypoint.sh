#!/bin/sh
set -e

envsubst '${VALID_REFERERS} ${ORIGIN}' < /nginx.conf.template > /etc/nginx/conf.d/default.conf

envsubst '${SECURE_LINK_SECRET}' < /secure_link.conf.template > /etc/nginx/secure_link.conf

if [ -z "$SECURE_LINK_SECRET" ]; then
    echo "# secure_link 未启用（SECURE_LINK_SECRET 未设置）" > /etc/nginx/conf.d/secure_link.conf
fi

exec "$@"
