FROM jupyter/all-spark-notebook

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_CTYPE=C.UTF-8

#RUN apt-get -y install graphviz

RUN pip install pystan theano gpflow tensorflow keras boto3 google-cloud google-api-python-client google-auth-httplib2 google-cloud-bigquery[pandas] pyarrow google-cloud-storage graphviz

RUN pip install jupyter_http_over_ws
RUN jupyter serverextension enable --py jupyter_http_over_ws
