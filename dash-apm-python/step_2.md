Copy the following command and replace `<KEY>` with your API key and execute:

`export DD_API_KEY=<KEY>`{{copy}}


Next, run the following command to start our docker services:

`docker-compose up`{{execute}}


Next, open the web interface to verify the application is up and running:

http://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com


Finally, open APM trace list to ensure traces are being submitted successfully:

https://app.datadoghq.com/apm/traces

