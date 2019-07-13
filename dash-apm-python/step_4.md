We can attach our own custom application metadata to spans.

Open `frontend/frontend/api.py` file.

Add the following code after the `app = Flask('api')`.

``` python
@app.before_request
def add_customer_id():
    # Get the current user's id
    customer_id = get_customer_id()

    # Get the current root span (the `flask.request` span)
    span = tracer.current_root_span()
    span.set_tag(customer_id', customer_id)
```{{copy}}

`restart-services`{{execute interrupt}}

Finally, open the service page for `frontend` to view the new metadata on traces.

https://app.datadoghq.com/apm/service/frontend
