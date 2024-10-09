FROM debian:bookworm-slim
RUN apt-get update

# for Unicode in YAML files
ENV LANG en_US.UTF-8
RUN apt-get install -y locales \
 && sed -i "s/^# $LANG/$LANG/" /etc/locale.gen \
 && locale-gen

RUN apt-get install -y ruby rake graphviz graphicsmagick poppler-utils

WORKDIR /opt
