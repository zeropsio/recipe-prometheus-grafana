#!/bin/bash

zsc envReplace prometheus.yml.tmpl prometheus.yml
./prometheus --web.enable-lifecycle --web.enable-admin-api --web.enable-remote-write-receiver --storage.tsdb.retention.time=${RETENTION_TIME:-15d}