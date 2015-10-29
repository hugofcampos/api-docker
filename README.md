# PhalconPHP API Docker

> Dockerized PHP development stack: Nginx, MySQL, MongoDB, PHP-FPM, PhalconPHP and Redis

[![Build Status](https://travis-ci.org/hugofcampos/api-docker.svg)](https://travis-ci.org/hugofcampos/api-docker)

PhalconPHP API Docker gives you everything you need for developing the API.

## What's inside

* [Nginx](http://nginx.org/)
* [PHP-FPM](http://php-fpm.org/)
* [PhalconPHP](https://phalconphp.com/)
* [MySQL](http://www.mysql.com/)
* [MongoDB](http://www.mongodb.org/)
* [Redis](http://redis.io/)

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

## Running

Set up a Docker Machine and then run:

```sh
$ docker-compose up
```

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## License

Copyright &copy; 2015 [Hugo Campos](http://github.com/hugofcampos). Licensed under the terms of the [MIT license](LICENSE.md).
