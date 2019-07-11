We can attach our own custom application metadata to spans.

Open `frontend/frontend/api.py` file.

Add the following code after the `app = Flask('api')`.

``` python
@app.before_request
def add_user_id():
    # Get the current user's id
    user_id = get_user_id()

    # Get the current root span (the `flask.request` span)
    span = tracer.current_root_span()
    span.set_tag('user_id', user_id)
```{{copy}}

Restart services `docker-compose up`{{execute interrupt}}

Finally, open the service page for `frontend` to view the new metadata on traces.

https://app.datadoghq.com/apm/resource/frontend/flask.request/
