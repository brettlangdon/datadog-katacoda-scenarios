With APM we can easily visualize where latencies are coming from.

Open `sensors/sensors.py` file in the editor.

Add the following to the `def refresh_sensors` endpoint.

```python
time.sleep(2)
```{{copy}}

When we are done the function should look like:

``` python
@app.route('/refresh_sensors')
def refresh_sensors():
    app.logger.info('Calling refresh sensor simulator')
    sensors = simulate_all_sensors()

    time.sleep(2)

    return jsonify({'sensor_count': len(sensors),
                    'system_status': sensors})
```{{copy}}

Restart our services `docker-compose up`{{execute interrupt}}

Open the service page for our `frontend` service.

https://app.datadoghq.com/apm/service/frontend/flask.request
