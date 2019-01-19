FROM ubuntu:latest
LABEL fr.itinsight.awsdocker.version="0.0.1-beta"
LABEL fr.itinsight.awsdocker.version.is-production="true"
MAINTAINER Mehdi TAZI, mehdi.tazi@itinsight.fr

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y


RUN apt-get install -y \
    git \
    maven \
    less \
    man \
    ssh \
    python \
    python-pip \
    python-virtualenv \
    openjdk-8-jdk  \
    vim \
    sudo


RUN pip install awscli --upgrade && \
    pip install boto3


#TODO : make mehdi as an external parameter
RUN adduser --disabled-login --gecos '' mehdi && \
    usermod -aG sudo mehdi

#RUN echo "root:mehdi" | chpasswd
RUN echo "mehdi:mehdi" | chpasswd mehdi

USER mehdi

ENV PYTHONIOENCODING=UTF-8

WORKDIR /home/mehdi/

#TODO : make mehdi as an external parameter
RUN mkdir samples && \
    mkdir projects && \
    mkdir projects/python_project

#TODO

COPY aws_credentials.conf .aws/credentials
COPY aws_config.conf .aws/config

RUN chown -R mehdi:mehdi samples && \
    chown -R mehdi:mehdi projects


WORKDIR /home/mehdi/samples

RUN git clone https://github.com/awsdocs/aws-cli-user-guide.git && \
    git clone https://github.com/awsdocs/aws-doc-sdk-examples.git

WORKDIR /home/mehdi/projects/python_project
RUN virtualenv venv

WORKDIR /home/mehdi/

#RUN echo "mehdi" | chown -R mehdi:mehdi share

#RUN printf "\nexport PATH=\"usr/local/bin/aws\"" >> /home/mehdi/.bashrc.txt

EXPOSE 80
EXPOSE 22

#docker build -t awsdocker:latest .
#docker run --rm -it --name AWSWorkStation -p 8888:80 -p 2222:22 -v /Users/mehditazi/Downloads/AWSDocker/share:/home/mehdi/share/ awsdocker:latest
