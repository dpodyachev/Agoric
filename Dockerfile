FROM ubuntu:20.04
MAINTAINER d1_7174

ARG PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin:/root/go/bin
ARG DEBIAN_FRONTEND=noninteractive
ARG GO111MODULE=on
ARG GOPATH=/root/go
ARG GOROOT=/usr/local/go
ARG OTEL_EXPORTER_PROMETHEUS_PORT=9464
WORKDIR /root
LABEL version=Agoric2.14
LABEL maintainer='d1#7174'
EXPOSE 80 8812 9164 26660

RUN apt-get update; apt-get install -qq git curl wget mc dialog build-essential jq ; alias sudo=''
RUN wget -qO chain.json https://devnet.agoric.net/network-config ;chainName=$(jq -r .chainName < chain.json) ;echo "ChainName=$chainName" ; \
wget -qO- https://deb.nodesource.com/setup_12.x | bash ; \
wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - ; echo "deb https://dl.yarnpkg.com/debian/ stable main" |tee /etc/apt/sources.list.d/yarn.list ;\
apt-get update ; apt-get upgrade -y ; curl https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz | tar -C/usr/local -zxf - ;apt-get install -qq nodejs=12.* yarn ;\
git clone https://github.com/Agoric/agoric-sdk -b @agoric/sdk@2.14.0 ;cd agoric-sdk ; yarn install ; yarn build ; cd packages/cosmic-swingset ; make ;\
echo -e "export GOROOT=/usr/local/go\nexport GOPATH=/root/go\nexport GO111MODULE=on\nexport PATH=$PATH:/usr/local/go/bin:/root/go/bin\nexport OTEL_EXPORTER_PROMETHEUS_PORT=9464\n" >>$HOME/.profile

#umask 0 ; docker run -it --rm --name agoric4 --hostname agoric4 \
#-v /etc/localtime:/etc/localtime:ro \
#-v /srv/agoric-sdk/:/root/agoric-sdk/ \
#-v /srv/.ag-chain-cosmos:/root/.ag-chain-cosmos \
#-v /srv/.ag-cosmos-helper:/root/.ag-cosmos-helper \
#-p 9464:9464 -p 26660:26660 -p :26660 agoric7
