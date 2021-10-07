FROM summerwind/actions-runner-dind:v2.283.3-ubuntu-20.04

RUN sudo apt-get update

RUN sudo apt-get install --no-install-recommends --no-install-suggests -y php php-apcu \
  php-bcmath php-dom php-ctype php-curl php-exif php-fileinfo php-fpm php-gd \
  php-gmp php-iconv php-intl php-json php-mbstring php-mysqlnd php-soap php-redis \
  php-mysqli php-opcache php-pdo php-phar php-posix php-simplexml php-sockets \
  php-sqlite3 php-tidy php-tokenizer php-xml php-xmlwriter php-zip  

# remaining
# php-mcrypt
# php-openssl
# php-pcntl
# php-pdo_mysql
# php-session
# php-zlib
