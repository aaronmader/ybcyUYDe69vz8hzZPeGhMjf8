# adapted from: https://www.caktusgroup.com/blog/2017/03/14/production-ready-dockerfile-your-python-django-app/
FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ubuntugis/ppa \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 libapache2-mod-wsgi ntp mysql-client libmysqlclient-dev libssl-dev python3 python3-dev virtualenv build-essential libffi-dev libmagickwand-dev gdal-bin libgdal-dev libqpdf-dev python3-pip git
RUN pip3 install --upgrade pip
RUN mkdir /code/
# numpy is required during the installation of rasterio (which is unconventional and annoying.)
RUN pip3 install numpy uwsgi

COPY pip_requirements.txt /zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
RUN pip3 install -r zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
