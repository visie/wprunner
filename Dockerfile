FROM ubuntu:24.04

ENV TERM=linux
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -y  
RUN apt install -y apache2
RUN apt install -y php-fpm php-mysql php-mbstring php-xml php-gd php-curl php-zip php-imagick
RUN apt install -y mariadb-server mariadb-client
RUN apt install -y curl wget git unzip neovim

RUN a2enconf php8.3-fpm
RUN a2enmod proxy_fcgi
RUN a2enmod proxy
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod expires
RUN a2enmod vhost_alias

RUN sed -e 's/AllowOverride None/AllowOverride All/g' -i /etc/apache2/apache2.conf
RUN sed -e 's/\/var\/www\/html/\/var\/www\/wordpress/g' -i /etc/apache2/sites-available/000-default.conf
RUN sed -e 's/^max_execution_time.*/max_execution_time = 300/' -i /etc/php/8.3/fpm/php.ini

ADD scripts/runner.sh /usr/local/bin/runner.sh

RUN chmod +x /usr/local/bin/runner.sh

VOLUME /var/www/

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/runner.sh"]
