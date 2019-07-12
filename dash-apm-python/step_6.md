With APM we can easily visualize where latencies are coming from.

Open `sensors/sensors.py` file in the editor.

Add the following to the `def simulate_all_sensors` function.

```python
db.session.execute('SELECT pg_sleep(2);')
```{{copy}}

When we are done the function should look like:

``` python
@tracer.wrap(name='sensor-simulator')
def simulate_all_sensors():
    db.session.execute('SELECT pg_sleep(2);')
    sensors = Sensor.query.all()
    for sensor in sensors:
        sensor.value = random.randint(1,100)
    db.session.add_all(sensors)
    db.session.commit()
    app.logger.info('Sensor data updated')
    return [s.serialize() for s in sensors]
```{{copy}}

`restart-services`{{execute interrupt}}

Open the service page for our `frontend` service.

https://app.datadoghq.com/apm/service/frontend/flask.request
