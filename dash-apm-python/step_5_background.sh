#!/usr/bin/env bash

echo "DD_LOGS_ENABLED=true" >> /tracing-workshop/.env-agent
echo "DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true" >> /tracing-workshop/.env-agent

echo "DD_LOGS_INTEGRATION=true" >> /tracing-workshop/.env
