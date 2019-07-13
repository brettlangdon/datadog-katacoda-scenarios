#!/usr/bin/env bash

command -v yaml_cli > /dev/null && \
    yaml_cli -i /tracing-workshop/docker-compose.yml \
             -o /tracing-workshop/docker-compose.yml \
             --list-append \
             -s services:frontend:environment 'WORKSHOP_ADD_ERRORS=true'
