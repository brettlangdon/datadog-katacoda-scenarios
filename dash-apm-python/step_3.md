We are going to enable trace search and analytics feature
which is not enabled by default OOTB for Datadog APM.

To enable you can set the environment variable `DD_TRACE_ANALYTICS_ENABLED=true`.

We have taken care of this step for you by adding it to the `.env` file.

To have the change take effect restart our docker services:

`restart-services`{{execute interrupt}}

Finally, open trace analytics dashboard:

https://app.datadoghq.com/apm/search/analytics
