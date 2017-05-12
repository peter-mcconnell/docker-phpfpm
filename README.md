docker-phpfpm
=============

php and fpm running in lightweight container. This is an extremely lean image
designed for extending.

usage
-----

To make use of the image defined in this repo, you can pull it from the 
docker hub using the following image:

```Dockerfile
FROM pemcconnell/docker-phpfpm:7.1-alpine
```

make
----

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
volume at the WORDIR (`/app`) and running `php7 index.php`.

fpm
===

You can find the fpm configuration in `./php7/fpm.conf`. This is configured to
run on port 9000 by default.
