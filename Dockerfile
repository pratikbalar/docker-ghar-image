ARG BASE_IMAGE="summerwind/actions-runner-dind"
ARG BASE_IMAGE_TAG="v2.283.3-ubuntu-20.04"
FROM $BASE_IMAGE:$BASE_IMAGE_TAG
USER root
COPY --from=golang:1.17-buster "/usr/local/go/" "/usr/local/go/"
COPY --from=composer:2.1.11 "/usr/bin/composer" "/usr/local/bin/composer"
RUN set -ex; \
  curl -sL https://deb.nodesource.com/setup_14.x | bash -; \
  curl https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry -o /usr/bin/retry; \
  chmod +x /usr/bin/retry; \
  apt-get update; \
  apt-get install --no-install-recommends --no-install-suggests -y \
  php php-apcu php-bcmath php-dom php-ctype php-curl php-exif php-fileinfo php-fpm \
  php-gd php-gmp php-iconv php-intl php-json php-mbstring php-mysqlnd php-soap \
  php-redis php-mysqli php-opcache php-pdo php-phar php-posix php-simplexml \
  php-sockets php-sqlite3 php-tidy php-tokenizer php-xml php-xmlwriter php-zip \
  php-pear libgd-tools \
  nodejs \
  git unzip; \
  apt-get clean autoclean; \
  apt-get autoremove --yes
  # rm -rf /var/lib/{apt,dpkg,cache,log}/
ENV PATH="/usr/local/go/bin:${PATH}"
USER runner
ENV PATH="/usr/local/go/bin:${PATH}"
RUN go version; \
    php -v
# remaining
# php-mcrypt
# php-openssl
# php-pcntl
# php-pdo_mysql
# php-session
# php-zlib
