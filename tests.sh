#!/bin/bash

set -e

go test ./...

export IMPLEMENTATION=go

(cd jsonnet; go build)

export DISABLE_LIB_TESTS=true
export DISABLE_FMT_TESTS=true
export DISABLE_ERROR_TESTS=true
export JSONNET_BIN="$PWD/jsonnet/jsonnet"

git submodule update --recursive cpp-jsonnet
cd cpp-jsonnet
exec ./tests.sh
