FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git wget tar make

RUN wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin:/root/go/bin
ENV GOPATH /root/go

RUN mkdir -p $GOPATH/src/github.com/hashicorp/terraform
RUN cd $GOPATH/src/github.com/hashicorp/ && git clone https://github.com/hashicorp/terraform.git
RUN cd $GOPATH/src/github.com/hashicorp/terraform && make dev


CMD sleep 60
