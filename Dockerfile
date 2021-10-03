FROM linuxserver/code-server:3.12.0

ENV HOME="/config"

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php 
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php8.0-cli php8.0-xdebug php-zip php-curl unzip php-mbstring php-xml php-sqlite3 
RUN apt-get clean -y && apt-get autoclean -y 

COPY --from=composer /usr/bin/composer /usr/bin/composer

EXPOSE 8443
