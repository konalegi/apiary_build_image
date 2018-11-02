#! /bin/sh

set -e

./build.sh

if [ "$1" = "build" ]; then
  ./build.sh
elif [ "$1" = "push" ]; then
  apiary publish --api-name=$API_NAME
elif [ "$1" = "watch" ]; then
  ./fs_watcher.sh
elif [ "$1" = "bash" ]; then
  bash
else
  apiary preview --server --host='0.0.0.0' --watch
fi