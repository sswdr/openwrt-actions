#!/bin/bash

BRANCH_SSW=${1:-main}
BRANCH=${2:-backup.2026.08.18}

echo "src-git modem https://github.com/fildunsky/luci-app-5gmodem.git" >> feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a
