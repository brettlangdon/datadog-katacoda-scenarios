#!/usr/bin/env bash

# Setup workshop code
mkdir /tracing-workshop
git clone https://github.com/brettlangdon/distributed-tracing-with-apm-workshop /tracing-workshop
cd /tracing-workshop

# Start pulling containers as soon as they load
docker-compose pull
