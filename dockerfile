# use the debian base image provided by dotCloud
FROM debian
MAINTAINER solos lxl1217@gmail.com


# if you're behind a government firewall or company proxy
# ENV http_proxy http://proxy-prc.intel.com:911
# ENV https_proxy https://proxy-prc.intel.com:911
# RUN echo "Acquire::http::proxy \"proxy_server:port\";" >> /etc/apt/apt.conf
# RUN echo "Acquire::https::proxy \"proxy_server:port\";" >> /etc/apt/apt.conf


# choose a faster mirror
RUN echo "deb http://mirrors.sohu.com/debian/ wheezy main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://mirrors.sohu.com/debian/ wheezy-proposed-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.sohu.com/debian/ wheezy main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.sohu.com/debian/ wheezy-proposed-updates main non-free contrib" >> /etc/apt/sources.list

RUN apt-get update -y
# currently docker official ubuntu image has a problem with apt-get upgrade
# RUN apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get clean all


# install wget
RUN apt-get install -y  wget
RUN wget www.baidu.com
RUN rm index.html

#install vim editor
RUN apt-get install -y vim
