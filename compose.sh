#!/bin/sh
###!/usr/bin/env bash

docker-compose -f compose.yml up $*

echo "Don't forget to run sudo sysctl fs.inotify.max_user_watches=524288 on a host, to fix watchman"