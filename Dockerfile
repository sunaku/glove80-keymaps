FROM debian:bookworm-slim
RUN apt-get update

# for Unicode in YAML files
ENV LANG en_US.UTF-8
RUN apt-get install -y locales \
 && sed -i "s/^# $LANG/$LANG/" /etc/locale.gen \
 && locale-gen

# NOTE: rake provides ruby(1)
RUN apt-get install -y rake graphviz

WORKDIR /opt
