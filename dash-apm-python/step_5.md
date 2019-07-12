What happens when unexpected exceptions are raised from our application?

Open `frontend/frontend/api.py` file in the editor.

Add the following code to the beginning of the `def simulate_sensors` route.

``` python
maybe_raise_exception()
```{{copy}}

The end result function should look like:

``` python
@app.route('/simulate_sensors')
def simulate_sensors():
    maybe_raise_exception()

    app.logger.info('Simulating refresh of sensor data')
    resp = requests.get('http://sensors:5002/refresh_sensors')
    resp.raise_for_status()
    sensors = resp.json()
    return jsonify(sensors)
```{{copy}}

`restart-services`{{execute interrupt}}.

Open the `/simulate_sensors` resource page for our `frontend` service.

https://app.datadoghq.com/apm/service/frontend/flask.request
