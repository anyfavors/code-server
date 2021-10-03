FROM linuxserver/code-server:3.12.0

ENV HOME="/config"

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install -y php8.0
RUN apt-get upgrade 
RUN apt-get clean && apt-get autoclean && 

EXPOSE 8443
