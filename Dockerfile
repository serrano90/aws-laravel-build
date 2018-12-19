FROM php:7.3-cli
LABEL author="serrano.hernandez90@gmail.com"

RUN apt-get update && apt-get install -y jq python-pip zip unzip python-dev
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install AWS-CLI
RUN pip install awscli