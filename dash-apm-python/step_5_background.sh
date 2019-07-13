#!/usr/bin/env bash

command -v yaml_cli > /dev/null && \
    yaml_cli -i docker-compose.yml \
             -o docker-compose.yml \
             --list-append \
             -s services:frontend:environment 'WORKSHOP_ADD_ERRORS=true'
