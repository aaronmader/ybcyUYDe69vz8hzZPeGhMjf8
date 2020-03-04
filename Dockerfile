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


############################
# Install a recent version of Google Chrome, for selenium tests
# This code was adapted from Node, originally from: https://github.com/GoogleChrome/puppeteer/issues/2725
# Install latest chrome package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb

# Set display port to avoid crash
# From: https://github.com/joyzoursky/docker-python-chromedriver/blob/master/py2/py2.7-selenium/Dockerfile
# This does not appear to be necessary, but keeping it here just in case
# ENV DISPLAY=:99
############################


# Install prince
RUN apt-get update \
    && apt-get install -y libcurl3
RUN wget https://www.princexml.com/download/prince_12.5-1_ubuntu16.04_amd64.deb \
    && dpkg -i prince_12.5-1_ubuntu16.04_amd64.deb \
    && apt-get install -f


# Install some requirements
COPY pip_requirements.txt /zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
RUN pip3 install -r zsy2XXMCnaF7LMfmDGz7z7vB_requirements.txt
