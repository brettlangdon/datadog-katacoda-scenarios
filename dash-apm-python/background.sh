#!/usr/bin/env bash

# Setup workshop code
mkdir /tracing-workshop
git clone https://github.com/brettlangdon/distributed-tracing-with-apm-workshop /tracing-workshop
cd /tracing-workshop

# Try to install yaml_cli helper
(cd /tmp/ && git clone https://github.com/Gallore/yaml_cli && cd ./yaml_cli && python setup.py install) || true

# Start pulling containers as soon as they load
docker-compose pull
