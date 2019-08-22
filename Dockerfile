FROM jupyter/all-spark-notebook

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_CTYPE=C.UTF-8

#RUN apt-get -y install graphviz
RUN pip install --upgrade pip
RUN pip install --upgrade numpy scikit-learn pystan theano gpflow tensorflow keras boto3 google-cloud google-api-python-client google-auth-httplib2 google-cloud-bigquery[pandas] pyarrow google-cloud-storage graphviz jupyter_http_over_ws OWSLib edward imbalanced-learn zarr netCDF4 xarray dask toolz geopandas

RUN conda install geoplot -c conda-forge

RUN pip install --upgrade mapclassify

RUN jupyter serverextension enable --py jupyter_http_over_ws

USER root
RUN apt-get update && apt-get install -y software-properties-common && \
 apt-get -y install build-essential libxml2-dev libcurl4-openssl-dev libssl-dev graphviz

# RUN conda install -c conda-forge cartopy
RUN mkdir -p /home/jovyan/ && chown jovyan /home/jovyan
RUN chgrp -R 0 /home/jovyan/ && \
    chmod -R g=u /home/jovyan/
RUN chmod 777 /home/jovyan

USER jovyan

RUN mkdir .R && echo "CXX14 = g++ -std=c++1y -Wno-unused-variable -Wno-unused-function -Wno-deprecated -Wno-ignored-attributes -fPIC" > .R/Makevars
