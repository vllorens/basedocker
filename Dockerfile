FROM centos:centos7
MAINTAINER Veronica Llorens Rico <vllorens9@gmail.com>

# Update base image and install EPEL
RUN yum -y update; yum -y install epel-release; yum clean all

# Install other stuff
RUN yum -y install wget curl vim nano unzip tar make gcc g++ gfortran && \
  yum clean all

# Install java
RUN yum install java-1.8.0-openjdk; yum clean all

# install python pip
RUN yum -y install git python-pip; yum clean all

#
# Create the home folder
#
RUN mkdir -p /root/
ENV HOME /root

WORKDIR ~/
