We have found the function which is raising the exception
and have determined it doesn't need to cause our application
to fail. Let us update the code to reflect our desired changes.

Open `frontend/frontend/utils.py`.

Add `@tracer.wrap()` decorator to the `def get_customer_data()` function.

We should have:

```python
@tracer.wrap()
def get_customer_data():
    current_app.logger.info('Fetching customer data')
```

This will add a span for this function so we can track when it fails.

Next, open `frontend/frontend/sensors.py`.

Edit `def get_sensor_data` and remove the `raise` call from the `try/except` block.

As well, we can change the log line to be `current_app.logger.warn` instead of `exception`.

We should end up with:

```python

def get_sensor_data():
    try:
        get_customer_data()
    except Exception:
        current_app.logger.warn('Failed to fetch customer data')

    current_app.logger.info('Simulating refresh of sensor data')
    resp = requests.get('http://sensors:5002/refresh_sensors', headers=get_request_headers())
    resp.raise_for_status()
    return resp.json()
```


`restart-services`{{execute interrupt}} to continue.

Open the `frontend` service page to continue.

https://app.datadoghq.com/apm/service/frontend
