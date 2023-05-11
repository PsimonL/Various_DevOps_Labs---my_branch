# Użycie Linux Alpine, najnowszej wersji jako "bazy"
FROM alpine:latest

# Instalacja git i openssh
RUN apk update && apk add --no-cache git openssh

# Sciezka gdzie powinno byc repo
WORKDIR /home/cloned_repo

# Klonowanie repo
RUN git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2023_INO.git
