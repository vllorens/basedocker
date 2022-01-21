FROM centos:centos7
MAINTAINER Veronica Llorens Rico <vllorens9@gmail.com>

# Update base image and install EPEL
RUN yum -y update; yum -y install epel-release; yum clean all

# Install other stuff
RUN yum -y install wget curl vim nano unzip tar bzip2 make gcc g++ gfortran ncurses-devel

# Install java
RUN yum -y install java-1.8.0-openjdk

# Install python3 and pip/pip3
RUN yum -y install python3
 
RUN yum -y install git python-pip
RUN yum -y install python3-pip

# Install R and dependencies for tidyverse
RUN yum -y install R-core R-devel
RUN yum -y install libxml2-devel curl-devel openssl-devel
