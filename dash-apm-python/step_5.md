# Enable Datadog logs agent

To enable logs collection we need to enable the logs agent in the Datadog agent.

To do so you can set the following environment variables:

```
DD_LOGS_ENABLED=true
DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
```

We have set these environment variables for you automatically.

These settings enable the logs agent and tells it to collect logs from all docker containers it finds.

# Enable trace id injection into logs

In order to coorelate traces and logs we need our services to inject
trace and span ids into our application logs.

We can enable inject by setting the `DD_LOGS_INTEGRATION=true` environment variable.

We have taken care of this step for you.

To complete the process `restart-services`{{execute interrupt}}

Finally, open logs dashboard:

https://app.datadoghq.com/logs
