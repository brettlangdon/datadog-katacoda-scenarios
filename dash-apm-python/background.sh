#!/usr/bin/env bash
mkdir /tracing-workshop
git clone https://github.com/brettlangdon/distributed-tracing-with-apm-workshop /tracing-workshop
cd /tracing-workshop

docker-compose pull
