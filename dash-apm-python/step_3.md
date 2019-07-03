Add the following environment variable to the `frontend`, `node`, `pumps`,
and `sensors` services in `docker-compose.yml`.

`DD_ANALYTICS_ENABLED=true`{{copy}}


Afterwards restart docker services:

`docker-compose up`{{execute interrupt}}
