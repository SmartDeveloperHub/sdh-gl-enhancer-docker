FROM alejandrofcarrera/phusion.python
MAINTAINER Alejandro F. Carrera

ENV HOME /usr/lib/enhancer

# Create directories & virtual env for the Planner
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/enhancer
RUN /usr/lib/enhancer/.env/bin/pip install --upgrade gl-enhancer

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ADD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/enhancer"]
EXPOSE 5000
