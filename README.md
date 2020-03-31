# Dockerized python - poetry image

This is a base (onbuild) image of the python docker image. This build adds the following improvements:

* Default installation of poetry with `virtualenvs.create` set to false
  (No virtual environment will be built).
* Installation of the Google cloud DB proxy app.
* On build of `poetry install`

## Python version builds

Setting a docker `build-arg` results in additional python build versions. For example the following 
command will build a python3.8 image:

_The default build if left blank is currently set to python 3.7.7_

```
docker build -t test:latest-onbuild --build-arg=PYTHON_BUILD_VERSION=3.8 .
```
