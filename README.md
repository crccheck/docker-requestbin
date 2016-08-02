Requestbin
==========

Starts a [requestbin](https://github.com/Runscope/requestbin) server on port
80.


Usage
-----

### With Docker-Compose

If you check out this repository locally or grab the [docker-compose.yml],
you can get a server running on port 8000 quickly with:

    docker-compose up

  [docker-compose.yml]: https://github.com/crccheck/docker-requestbin/blob/master/docker-compose.yml

### Running a container by hand

If you wanted to run this manually, it would look something like:

    docker run -d --name requestbin_redis redis
    docker run -d --name requestbin \
      --link requestbin_redis:redis \
      -e REDIS_URL=redis://redis:6379/0 \
      crccheck/requestbin


Prior Art
---------

[goldeneggg/centos-requestbin](https://registry.hub.docker.com/u/goldeneggg/centos-requestbin/):
This image is 1.503 GB, compared to 174 MB for mine.

[agaveapi/requestbin](https://registry.hub.docker.com/u/agaveapi/requestbin/):
very similar to this project now, only uses a fork.
