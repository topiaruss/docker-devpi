FROM python:3

LABEL version='4.3.1'
LABEL description='[Devpi](http://doc.devpi.net/) server.'

RUN apt-get remove -y \
  imagemagick \
  binutils \
  && apt-get update \
  && apt-get -y upgrade \
  && apt-get -y autoremove \
  && apt-get -y clean


RUN pip install \
    devpi-server==4.3.0 \
    devpi-client==3.0 \
    devpi-web==3.2 \
    devpi-cleaner==0.2.0 \
    devpi-slack==0.1.3 \
    devpi-tools==0.4 \
    devpi-semantic-ui==0.2.2 \
    devpi-builder==3.0.1 \
    devpi-passwd-reset==1.0.0

VOLUME /mnt
EXPOSE 3141
ADD entrypoint.sh /
CMD ["/entrypoint.sh"]
