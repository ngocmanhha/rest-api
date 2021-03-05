#!/bin/sh
VERSION=1.0.0
docker build -f Dockerfile . -t rest-api:${VERSION}