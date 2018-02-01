#!/bin/sh
set -i

LOCAL_LIB_DIR="/bridge-lib"
BRIDGE_LIB_DIR="/usr/local/tomcat/webapps/JavaBridge/WEB-INF/lib"

if [ -n "$(ls -A ${LOCAL_LIB_DIR})" ]; then
    \cp -rf "${LOCAL_LIB_DIR}"/* "${BRIDGE_LIB_DIR}"/
fi

sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/7.0/apache2/php.ini
sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/7.0/cli/php.ini
service apache2 start

exec "$@"
