FROM ubuntu:20.04
RUN mkdir /code/


# Set up ALL os-level dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    # core python deps
    ntp python3 python3-pip git \
    # mysqlclient
    mysql-client \
    libmysqlclient-dev \
    # wand
    libmagickwand-dev \
    # lxml
    libxml2-dev libxslt-dev \
    # nginx
    nginx \
    # prince
    wget gdebi-core


# Prince
RUN wget https://www.princexml.com/download/prince_14.2-1_ubuntu20.04_amd64.deb \
    && gdebi --non-interactive prince_14.2-1_ubuntu20.04_amd64.deb


# Install some requirements
COPY pip_requirements.txt /zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
RUN pip3 install -r zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
