#!/bin/sh
set -x
sh ./generate_env-config.sh > ./env-config.js
nginx -g "daemon off;"