FROM quay.io/widen/oracle-server-jre:8

RUN apt-get update && \
  apt-get -y --no-install-recommends install firefox xvfb && \
  rm -rf /tmp/* && \
  apt-get -y --purge autoremove && apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* /var/cache/debconf/* /tmp/* /var/tmp/*
