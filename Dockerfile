FROM centos:centos7
MAINTAINER Veronica Llorens Rico <vllorens9@gmail.com>

# Update base image and install EPEL
RUN yum -y update; yum -y install epel-release; yum clean all

# Install other stuff
RUN yum -y install wget curl vim nano unzip tar bzip2 make gcc g++ gfortran ncurses-devel zlib-devel

# Install java
RUN yum -y install java-1.8.0-openjdk

# Install python3 and pip/pip3
RUN wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz 
RUN tar -xzf Python-3.7.11.tgz && \
    cd Python-3.7.11/ && \
    ./configure --prefix=/usr/local/python3.7 --enable-optimizations && \
    make && \
    make install

RUN cd ../ && \
    rm Python-3.7.11.tgz

RUN ln -s /usr/local/python3.7/bin/python3.7 /usr/bin/python3
RUN ln -s /usr/local/python3.7/bin/pip3.7 /usr/bin/pip3

RUN yum -y install git python-pip
RUN pip3 install --upgrade pip

# Install R and dependencies for tidyverse
RUN yum -y install R-core R-devel
RUN yum -y install libxml2-devel curl-devel openssl-devel

# Install conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-py37_4.10.3-Linux-x86_64.sh -b -f
RUN /root/miniconda3/bin/conda init