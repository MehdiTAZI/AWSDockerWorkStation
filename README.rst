This repository contains a Docker image with all necessary bins, sources, documentations to start working with AWS using CLI, Python and Java.

<https://github.com/MehdiTAZI/AWSDocker>

AWS CLI and python boto3 SDK, code examples

MAIN & HOW TO USE
==================

The docker image is organized by folders. For instance, all of the examples are under the folder samples.

* First, fill correctly the aws_credentials.conf and aws_config.conf
* Second, build the docker image from the dockerfile
.. codeblock:: docker build -t awsdocker:latest .
* Third, run the docker container
.. codeblock:: docker run --rm -it --name AWSWorkStation -p 8888:80 -p 2222:22 -v /Users/mehditazi/AWSDocker/share:/home/mehdi/share/ awsdocker:latest

Folder .aws
-----------------------------

All the necessary configurations of AWS CLI are here.

* credentials : contains the AWS credentials : aws_access_key_id & aws_secret_access_key
* config : region & output format

Folder projects
-----------------------------

Projects are copied here, For instance, he sub folder python_project contains a configued pyhton virtual env, ready to start a new pyhton project.

Folder samples
-----------------------------

Many samples are copied here : 

* aws-cli-user-guide sub folder : contains many samples on how to use the AWS CLI in order to interact with AWS Services, all the samples are cloned from the https://github.com/awsdocs/aws-cli-user-guide.git
* aws-doc-sdk-examples sub folder : contains many samples of using AWS Services using different SDKs (Java, Python ...), all the samples are cloned from the https://github.com/awsdocs/aws-doc-sdk-examples.git
