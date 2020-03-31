ARG PYTHON_BUILD_VERSION=3.7.7

FROM python:${PYTHON_BUILD_VERSION}-buster

LABEL maintainer="Matt Seymour <matt.seymour@enveloprisk.com>"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/app
WORKDIR /opt/app

ENV PYTHONPATH /opt/app

RUN pip install --no-cache-dir poetry==1.0.5 \
    && poetry config virtualenvs.create false

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /opt/cloud_sql_proxy
RUN chmod +x /opt/cloud_sql_proxy

ONBUILD COPY poetry.lock .
ONBUILD COPY pyproject.toml .
ONBUILD RUN poetry install
ONBUILD COPY . /opt/app
