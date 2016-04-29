FROM peltikalle/basepython

MAINTAINER Janne Pellikka

USER root

RUN yum update -y && yum install -y \
		libpng-devel \
		freetype-devel \
		blas-devel \
		lapack-devel \
	&& yum clean all

RUN python3.4 -m pip install pip --upgrade && \
	python3.4 -m pip install \
		scipy \
		numpy \
		pandas \
		ipython \
		jupyter \
		scikit-learn \
		pystan \
		matplotlib \
		seaborn

RUN python3.4 -m pip install \
    	boto

ADD scripts/launch_notebook.sh /home/foobar/scripts/launch_notebook.sh

CMD ["/bin/bash", "/home/foobar/scripts/launch_notebook.sh"]

USER foobar
