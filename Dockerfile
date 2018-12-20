FROM php:7.3-cli
LABEL author="serrano.hernandez90@gmail.com"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends yarn
# Install Python
RUN apt-get install -y jq python-pip zip unzip python-dev
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install Serverless
RUN npm install -g npm
RUN npm install -g serverless
# Install AWS-CLI
RUN pip install awscli