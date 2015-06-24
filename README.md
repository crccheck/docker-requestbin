Requestbin
==========

Starts a [requestbin](https://github.com/Runscope/requestbin) server on port
80.


Usage
-----

This app is designed to work in conjunction with Redis. There's an example in
the Makefile that looks like:

    docker run -d --name requestbin_redis redis
    docker run -d --name requestbin \
      --link requestbin_redis:redis \
      -e REDIS_URL=redis://redis:6379/0 \
      requestbin


Prior Art
---------

[goldeneggg/centos-requestbin](https://registry.hub.docker.com/u/goldeneggg/centos-requestbin/):
This image is 1.503 GB, compared to 174 MB for mine.

[agaveapi/requestbin](https://registry.hub.docker.com/u/agaveapi/requestbin/):
Not a verified Docker image.
