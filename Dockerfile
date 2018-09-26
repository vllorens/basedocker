FROM centos:centos7
MAINTAINER Veronica Llorens Rico <vllorens9@gmail.com>

# update base image and install useful stuff
RUN yum -y update && \
  yum -y install wget curl vim nano unzip tar make gcc g++ gfortran && \
  yum clean all

# install python pip
RUN yum -y install git python-pip; yum clean all

#
# Create the home folder
#
RUN mkdir -p /root/
ENV HOME /root

WORKDIR ~/
