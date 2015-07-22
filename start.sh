#!/bin/bash

[[ $CONFIG_PATH == http* ]] && curl -s $CONFIG_PATH > /config.json && CONFIG_PATH="/config.json"

if [ -e "$CONFIG_PATH" ]; then
  /mesos-dns --config $CONFIG_PATH
else
  echo "Missing config file -- please set a valid CONFIG_PATH"
  exit 1
fi