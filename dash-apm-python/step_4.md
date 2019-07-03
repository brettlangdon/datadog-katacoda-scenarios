# Enable Datadog logs agent

Add the following environment variables to the `agent` service in `docker-compose.yml`.

```
multiline
copy
```{{copy}}

`DD_LOGS_ENABLED=true`{{copy}}
`DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true`{{copy}}

Our service should look like:

```yaml
agent:
  environment:
    - DD_API_KEY
    - DD_APM_ENABLED=true
    - DD_TAGS='env:apm-workshop'
    - DD_LOGS_ENABLED=true
    - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
```

# Enable trace id injection into logs

Add the following environment variable to the `frontend`, `node`, `pumps`,
and `sensors` services in `docker-compose.yml`.

`DD_LOGS_INTEGRATION=true`{{copy}}

Our services should look like:

```yaml
frontend:
    environment:
      - DATADOG_SERVICE_NAME=frontend
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_ANALYTICS_ENABLED=true
      - DD_LOGS_INTEGRATION=true
```

Afterwards restart docker services:

`docker-compose up`{{execute interrupt}}

Finally, open logs dashboard:

https://app.datadoghq.com/logs
