#docker-phpfpm

php and fpm running in lightweight container. This is an extremely lean image
designed for extending.

The contents and commands below are somewhat generalised and refer to the 
contents within each of the subdirectories - each of these subdirectories 
refer to the relevant version of PHP.

usage
-----

To make use of the image defined in this repo, you can pull it from docker hub
using the following image, and add any packages you need, e.g:

```Dockerfile
FROM pemcconnell/docker-phpfpm:7.1-alpine

RUN apk add --update \
      php-json \
      php-zlib \
      php-xml \
      php-phar
```

make
----

This repo is designed for supporting more php versions in future. These will 
manifest as directories on the top level directory. Currently there is only a 
single version of PHP supported, 7.1, which can be found in the `./php7.1` 
directory. The Makefile assumes you want to use this folder when calling `make`
commands - you can override this by setting `PHPFOLDER=php5.4` when calling the
`make` commands.

The following convenience commands are available:

deploy (and build)
------------------

```bash
make deploy TAG=7.1-alpine
```

This command builds the docker image and pushes it to the `$IMAGE:TAG`. The 
default for `$IMAGE` is set in the `./Makefile`. This can be passed in as an 
optional argument:

```bash
make deploy TAG=7.1-alpine IMAGE=dockerhubusername/foo
```

build only
----------

If you only wish to build the image locally you can call:

```bash
make build TAG=7.1-alpine
```

run shell
---------

Sometimes it's useful to run a shell inside the container. To do so, you can 
run:

```bash
make sh TAG=7.1-alpine
```

test run
--------

As a very simple example, a convenience method is supplied that runs the file 
located in `./app/index.php` against the container, by mounting `./app` as a 
volume at the WORDIR (`/app`) and running `php index.php`.

fpm
===

You can find the fpm configuration in `./${PHPFOLDER}/php/fpm.conf`. This is configured to
run on port 9000 by default.

php
===

You can find the fpm configuration in `./${PHPFOLDER}/php/php.ini`.
