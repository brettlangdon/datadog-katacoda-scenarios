To enable the Datadog process agent add the following environment variable
to the `agent` service.

`DD_PROCESS_AGENT_ENABLED=true`{{copy}}.

Our service should look like:

```yaml
agent:
  environment:
    - DD_API_KEY
    - DD_APM_ENABLED=true
    - DD_TAGS='env:apm-workshop'
    - DD_LOGS_ENABLED=true
    - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
    - DD_PROCESS_AGENT_ENABLED=true
```

Next, restart our docker services:

`docker-compose up`{{execute interrupt}}

Finally, open the process dashboard:

https://app.datadoghq.com/process
