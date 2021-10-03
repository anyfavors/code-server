FROM linuxserver/code-server:3.12.0

ENV HOME="/config"

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt-get update -y && apt-get upgrade
RUN apt-get install -y php8.0 
RUN apt-get clean -y && apt-get autoclean -y 

EXPOSE 8443
