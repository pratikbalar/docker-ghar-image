FROM docker.io/library/golang:1.17-buster as golang
FROM docker.io/library/composer:2.1.9 as composer
FROM docker.io/bitnami/git:latest as binaries
WORKDIR /bins
RUN \
  curl -Lo retry https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry; \
  curl -Lo kind  https://github.com/kubernetes-sigs/kind/releases/download/v0.11.1/kind-linux-amd64; \
  chmod +x -R /bins/
FROM docker.io/summerwind/actions-runner-dind:v2.284.0-ubuntu-20.04
USER root
COPY --from=golang    "/usr/local/go/"      "/usr/local/go/"
COPY --from=composer  "/usr/bin/composer/"  "/usr/local/bin/composer/"
COPY --from=binaries  "/bins/"              "/usr/local/bin/"

RUN set -x; \
  curl -sL https://deb.nodesource.com/setup_14.x | bash -; \
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
# remaining
# php-mcrypt
# php-openssl
# php-pcntl t
# php-pdo_mysql
# php-session
# php-zlib
