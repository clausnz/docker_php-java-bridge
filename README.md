# Docker PHP/Java Bridge

Docker container with installed PHP/Java Bridge (http://php-java-bridge.sourceforge.net/pjb/).

## About

#### Installed Software

PHP/Java Bridge Version `7.2.0`  
PHP Version `PHP 7.0.27-0+deb9u1`  
Tomcat Server `Apache Tomcat/8.5.27`   
Apache Server  `Apache/2.4.25`  

#### Shared volumes

- /var/www/html
- /bridge-lib

## Build Image

    git clone https://github.com/clausnz/docker-php_java_bridge.git
    cd docker-php_java_bridge
    docker build -t <tag_name> .

## Run Container

#### Example:

Create directory `php_java_bridge` with the following directory structure:  

    php_java_bridge/
    |-- html
    |  -- file_1.php
    |  -- file_2.php
    |  -- ...
    |-- lib
    |  -- javalib_1.jar
    |  -- javalib_2.jar
    |  -- ...

Change into this directory and execute:

    docker run \
    -v $(pwd)/html/:/var/www/html \
    -v $(pwd)/lib:/bridge-lib \
    -d \
    -p 8888:80 \
    -p 8080:8080 \
    --name my_bridge \
    clausnz/php-java-bridge:latest

Open url at   
`http://localhost:8888` (Apache Server)  
`http://localhost:8080/JavaBridge` (Tomcat Server)   

## Dokumentation

You can find various documentation on the internet. Here is a short list:

* http://php-java-bridge.sourceforge.net/pjb/how_it_works.php
* https://www.developer.com/java/other/php-with-java-using-php-java-bridge-tutorial.html
* http://dasunhegoda.com/access-java-function-php-phpjava-bridge/560/