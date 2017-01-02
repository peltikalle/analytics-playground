FROM centos:7

MAINTAINER Janne Pellikka

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN yum update -y && yum install -y \
    which \
    git \
    tar \
    wget \
    sqlite-devel \
    epel-release && \
  yum group install -y "Development Tools" && \
  yum install -y \
    openssl-devel \
    openssl \
    libpng-devel \
    freetype-devel \
    blas-devel \
    lapack-devel \
    postgresql-devel \
    bzip2-devel \
  && yum clean all

RUN wget http://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz \
&& xz -d Python-3.5.2.tar.xz \
&& tar -xvf Python-3.5.2.tar

WORKDIR Python-3.5.2
RUN ./configure --prefix=/usr/local \
&& make && make altinstall
WORKDIR /
RUN rm -rf Python-3.5.2; rm Python-3.5.2.tar

RUN python3.5 -m pip install pip --upgrade && \
  python3.5 -m pip install \
    scipy \
    numpy \
    pandas \
    ipython \
    jupyter \
    scikit-learn \
    pystan \
    matplotlib \
    seaborn \
    boto3 \
    psycopg2 \
    tensorflow

ARG UID

RUN useradd -ms /bin/bash -u $UID analytics
USER analytics

RUN mkdir -p /home/analytics/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -batch -keyout /home/analytics/certs/mykey.key -out /home/analytics/certs/mycert.pem

ADD scripts/start_notebook.sh /home/analytics/scripts/start_notebook.sh

CMD ["/bin/bash", "/home/analytics/scripts/start_notebook.sh"]
