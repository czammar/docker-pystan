FROM jupyter/all-spark-notebook

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_CTYPE=C.UTF-8

RUN pip install pystan
