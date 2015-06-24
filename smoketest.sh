#!/usr/bin/env bash
container=requestbin_1

set -e

function lookfor {
  grep --silent "$@" && echo " . . . PASS" || echo " . . . FAIL"
}

make run > /dev/null

IP=$(docker inspect --format '{{.NetworkSettings.IPAddress}}' ${container})
# make sure we can start a docker container
if [ -z $IP ]; then
  echo "Docker container ${container} not currently running"
  exit 1
fi

sleep 1

echo -n "Homepage should load"
\curl --silent --head $IP | lookfor "HTTP/1.1 200 OK"

echo -n "CSS styles should load"
\curl --silent --head $IP/static/css/bootstrap.css | lookfor "Content-Type: text/css"

echo -n "Static files should load"
\curl --silent --head $IP/static/img/logo-2x.png | lookfor "Content-Type: image/png"

make clean > /dev/null
