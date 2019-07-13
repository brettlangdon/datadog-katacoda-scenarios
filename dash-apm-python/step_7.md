# Enable Datadog logs agent

Add the following environment variables to the `agent` service in `docker-compose.yml`.

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
```{{copy}}

# Enable trace id injection into logs

Add the following environment variable to the `frontend`, `node`, `pumps`,
and `sensors` services in `docker-compose.yml`.

`DD_LOGS_INTEGRATION=true`{{copy}}

Our services should look like:

```yaml
frontend:
    env_file: ".env"
    environment:
      - DATADOG_SERVICE_NAME=frontend
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_ANALYTICS_ENABLED=true
      - DD_LOGS_INTEGRATION=true
```{{copy}}

``` yaml
node:
    env_file: ".env"
    environment:
      - DD_SERVICE_NAME=users-api
      - DD_TRACE_AGENT_HOSTNAME=agent
      - DD_ANALYTICS_ENABLED=true
      - DD_LOGS_INTEGRATION=true
```{{copy}}

``` yaml
pumps:
  env_file: ".env"
  environment:
    - FLASK_APP=pumps.py
    - FLASK_DEBUG=1
    - POSTGRES_PASSWORD=postgres
    - POSTGRES_USER=postgres
    - DATADOG_SERVICE_NAME=pumps-service
    - DATADOG_TRACE_AGENT_HOSTNAME=agent
    - DD_ANALYTICS_ENABLED=true
    - DD_LOGS_INTEGRATION=true
```{{copy}}

``` yaml
sensors:
  env_file: ".env"
  environment:
    - FLASK_APP=sensors.py
    - FLASK_DEBUG=1
    - POSTGRES_PASSWORD=postgres
    - POSTGRES_USER=postgres
    - DATADOG_SERVICE_NAME=sensors-api
    - DATADOG_TRACE_AGENT_HOSTNAME=agent
    - DD_ANALYTICS_ENABLED=true
    - DD_LOGS_INTEGRATION=true
```{{copy}}


Afterwards restart docker services:

`restart-services`{{execute interrupt}}

Finally, open logs dashboard:

https://app.datadoghq.com/logs
