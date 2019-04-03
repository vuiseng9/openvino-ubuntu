#!/usr/bin/env bash

container=ubuntu-media

sudo docker build -f media_base.Dockerfile . -t ${container}
