# image for tempest test set

FROM ubuntu:14.04
MAINTAINER Eugene Kiselev <yauheny.kisialiou@altoros.com>


RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
# install system wide packages
RUN apt-get install -y unzip wget python gcc python-dev libffi-dev libssl-dev
# install pip tool
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# install tempest
RUN wget https://github.com/Ykisialiou/tempest/archive/master.zip
RUN unzip master.zip -d /tempest


CMD ["bash"]
