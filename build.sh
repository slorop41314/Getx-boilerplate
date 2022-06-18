#!/bin/bash

# build.sh

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo -e "Missing arguments: [apk|appbundle|ios] [release|debug|profile] [dev|staging|prod]"
  # invalid arguments
  exit 128
fi

DART_DEFINES=$(scripts/generate_dart_defines.sh $3)

if [ $? -ne 0 ]; then
  echo -e "Failed to generate dart defines"
  exit 1
fi

echo -e "artifact: $1, type: $2, flavor: $3\n"
echo -e "DART_DEFINES: $DART_DEFINES\n"

args=("$@")
rest_args=("${all_args[@]:3}")
# eval "flutter build $1 --$2 --flavor $3 $DART_DEFINES"
eval "flutter build $1 --$2 $DART_DEFINES ${rest_args}"