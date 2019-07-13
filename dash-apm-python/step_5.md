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

In order to coorelate traces and logs we need our services to inject
trace and span ids into our application logs.

We can enable inject by setting the `DD_LOGS_INTEGRATION=true` environment variable.

We have taken care of this step for you.

To complete the process `restart-services`{{execute interrupt}}

Finally, open logs dashboard:

https://app.datadoghq.com/logs
