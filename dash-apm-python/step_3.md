Add the following environment variable to the `frontend`, `node`, `pumps`,
and `sensors` services in `docker-compose.yml`.

`DD_TRACE_ANALYTICS_ENABLED=true`{{copy}}

Our services should look like:

``` yaml
frontend:
  env_file: ".env"
  environment:
    - FLASK_APP=api.py
    - FLASK_DEBUG=1
    - DATADOG_SERVICE_NAME=frontend
    - DATADOG_TRACE_AGENT_HOSTNAME=agent
    - DD_TRACE_ANALYTICS_ENABLED=true
```{{copy}}

``` yaml
node:
  env_file: ".env"
  environment:
    - DD_SERVICE_NAME=users-api
    - DD_TRACE_AGENT_HOSTNAME=agent
    - DD_TRACE_ANALYTICS_ENABLED=true
`{{copy}}

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
    - DD_TRACE_ANALYTICS_ENABLED=true
`{{copy}}

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
    - DD_TRACE_ANALYTICS_ENABLED=true
`{{copy}}


Afterwards restart docker services:

`restart-services`{{execute interrupt}}


Finally, open trace analytics dashboard:

https://app.datadoghq.com/apm/search/analytics
