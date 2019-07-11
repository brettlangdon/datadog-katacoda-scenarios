Add the following environment variable to the `frontend`, `node`, `pumps`,
and `sensors` services in `docker-compose.yml`.

`DD_TRACE_ANALYTICS_ENABLED=true`{{copy}}

Our services should look like:

``` yaml
frontend:
    environment:
      - DATADOG_SERVICE_NAME=frontend
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_ANALYTICS_ENABLED=true
```

Afterwards restart docker services:

`docker-compose up`{{execute interrupt}}


Finally, open trace analytics dashboard:

https://app.datadoghq.com/apm/search/analytics
