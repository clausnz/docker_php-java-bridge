FROM tomcat:latest

MAINTAINER Claus Bayer <claus.bayer@gmail.com>

# env variables
ENV JAVA_BRIDGE_VERSION="7.2.0"
ENV JAVA_BRIDGE_URL="http://sourceforge.net/projects/php-java-bridge/files/Binary%20package/php-java-bridge_${JAVA_BRIDGE_VERSION}/php-java-bridge_${JAVA_BRIDGE_VERSION}_documentation.zip/download"
ENV TOMCAT_DIR="/usr/local/tomcat"

# install php & apache
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    libapache2-mod-php \
    php-cgi \
    php-mcrypt \
    php-mysql \
    php-sqlite3

# install bridge
RUN cd /tmp && \
    wget -O JavaBridge.zip "${JAVA_BRIDGE_URL}" && \
    unzip JavaBridge.zip -d "JavaBridge" && \
    unzip -o JavaBridge/JavaBridge.war -d "${TOMCAT_DIR}"/webapps/JavaBridge && \
    rm -rf JavaBridge*

# volumes
VOLUME ["/bridge-lib", "/var/www/html"]

# entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 80 8080
CMD ["catalina.sh", "run"]