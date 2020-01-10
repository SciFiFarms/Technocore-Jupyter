FROM jupyter/datascience-notebook:41e066e5caa8
# For usage of data detective, checkout https://github.com/robmarkcole/HASS-data-detective
# It's worth noting that Home Assistant only keeps the last 10 days worth of data. If you
# want further back than that, you'll need to connect to the influxdb service (InfluxDB).
RUN pip install HASS-data-detective influxdb
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

#ENV JUPYTER_ENABLE_LAB=yes 
