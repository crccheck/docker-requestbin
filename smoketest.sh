#!/usr/bin/env bash
container=requestbin_requestbin_1

set -e

function lookfor {
  grep --silent "$@" && echo " . . . PASS" || echo " . . . FAIL"
}

host=localhost:8000

echo -n "Homepage should load"
\curl --silent --head ${host} | lookfor "HTTP/1.1 200 OK"

echo -n "CSS styles should load"
\curl --silent --head ${host}/static/css/bootstrap.css | lookfor "Content-Type: text/css"

echo -n "Static files should load"
\curl --silent --head ${host}/static/img/logo-2x.png | lookfor "Content-Type: image/png"
