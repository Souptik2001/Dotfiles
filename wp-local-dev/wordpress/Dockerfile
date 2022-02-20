FROM wordpress:latest

RUN apt-get update && apt-get install apt-file -y && apt-file update && apt-get install vim -y && apt-get install less -y

RUN apt-get install mariadb-client

RUN curl --output /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

RUN echo "alias wp='wp --allow-root --path=/var/www/html'" >> ~/.bashrc