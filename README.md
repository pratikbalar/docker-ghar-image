# GHAR (DinD) runner image

GitHub Actions D-in-D image for Self-Hoster runner based on [summerwind/actions-runner-dind](https://hub.docker.com/r/summerwind/actions-runner-dind)

## Packages

- Golang    1.17
- Node      14.18.0
- npm       6.14.15
- Composer  2.1.9
- PHP       7.4.3
  - php-apcu, php-bcmath, php-dom, php-ctype, php-curl, php-exif, php-fileinfo, php-fpm, php-gd, php-gmp, php-iconv, php-intl, php-json, php-mbstring, php-mysqlnd, php-soap, php-redis, php-mysqli, php-opcache, php-pdo, php-phar, php-posix, php-simplexml, php-sockets, php-sqlite3, php-tidy, php-tokenizer, php-xml, php-xmlwriter, php-zip, php-pear, libgd-tools
<!-- - Docker    20.10.8 -->
- [retry](https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry)
- wget, curl, unzip

## Run

`docker run -it --entrypoint=bash --rm improwised/ghar-image`

## Build

- `docker buildx build -t ghar-image .`
