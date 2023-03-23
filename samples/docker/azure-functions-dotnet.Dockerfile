FROM mcr.microsoft.com/dotnet/sdk:6.0
# FROM mcr.microsoft.com/azure-functions/dotnet:4
# FROM node:18-buster


RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y \
    build-essential \
    curl \
    git \
    wget

ENV NVM_DIR="/root/.nvm"
ENV NODE_VERSION="lts/*"

RUN mkdir -p ${NVM_DIR}

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN /root/.nvm/install.sh --latest-npm --default $NODE_VERSION
RUN . /root/.nvm/nvm.sh && npm i -g azure-functions-core-tools@4 --unsafe-perm true

# RUN cd ./dotnet; dotnet build --configuration Release --interactive

# RUN dotnet add package Microsoft.SemanticKernel -s local

ADD ./ /opt/semantic-kernel/
WORKDIR /opt/semantic-kernel/

# ENTRYPOINT [ "func" ]
