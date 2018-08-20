# adapted from: https://www.caktusgroup.com/blog/2017/03/14/production-ready-dockerfile-your-python-django-app/
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntugis/ppa
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-wsgi ntp mysql-client libmysqlclient-dev libssl-dev python-dev virtualenv build-essential libffi-dev libmagickwand-dev gdal-bin libgdal-dev libqpdf-dev python-pip git

RUN mkdir /code/
# numpy is required during the installation of rasterio (which is unconventional and annoying.)
RUN pip install numpy uwsgi
