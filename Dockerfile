FROM linuxserver/code-server:3.12.0

ENV HOME="/config"

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php && apt-get update && apt-get upgrade -y
RUN apt-get install -y php8.0 
RUN apt-get clean -y && apt-get autoclean -y 

EXPOSE 8443
