FROM jupyter/datascience-notebook:lab-1.2.5
# For usage of data detective, checkout https://github.com/robmarkcole/HASS-data-detective
# It's worth noting that Home Assistant only keeps the last 10 days worth of data. If you
# want further back than that, you'll need to connect to the influxdb service (InfluxDB).
RUN pip install HASS-data-detective SQLAlchemy influxalchemy jupyterlab-git jupyterlab_sql

COPY jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

ENV JUPYTER_ENABLE_LAB=yes 

RUN jupyter labextension install "@jupyterlab/git"
RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix
RUN jupyter lab build
## Add dogfish
#COPY dogfish/ /usr/share/dogfish
#COPY migrations/ /usr/share/dogfish/shell-migrations
#RUN ln -s /usr/share/dogfish/dogfish /usr/bin/dogfish
#RUN mkdir /var/lib/dogfish 
## Need to do this all together because ultimately, the config folder is a volume, and anything done in there will be lost. 
#RUN mkdir -p /var/www/html/config/ && touch /var/www/html/config/migrations.log && ln -s /var/www/html/config/migrations.log /var/lib/dogfish/migrations.log 

#
### Set up the CMD as well as the pre and post hooks.
#COPY go-init /bin/go-init
#COPY entrypoint.sh /usr/bin/entrypoint.sh
#COPY exitpoint.sh /usr/bin/exitpoint.sh
#
#ENTRYPOINT ["go-init"]
#CMD ["-main", "/usr/bin/entrypoint.sh", "-post", "/usr/bin/exitpoint.sh"]
#
