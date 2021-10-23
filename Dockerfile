FROM linuxserver/code-server:v3.12.0-ls98

ENV HOME="/config"

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php 
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php8.0-cli php8.0-xdebug php-zip php-curl unzip php-mbstring php-xml php-sqlite3 php-intl php-bcmath
RUN apt-get clean -y && apt-get autoclean -y 
RUN echo "fs.inotify.max_user_watches=524288" | tee -a /etc/sysctl.conf
RUN truncate -s -$(tail 20 /etc/cont-init.d/30-config | wc -c) /etc/cont-init.d/30-config # permissions are not an issue where this is going.

EXPOSE 8443
