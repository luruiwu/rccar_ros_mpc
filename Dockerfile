# Dockerfile containing software for Control C++ quizzes
#FROM ubuntu:xenial
FROM docker.cogrob.com/ros_melodic_rccar_base

WORKDIR /opt/ipopt

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gfortran \
    cmake \
    pkg-config \
    unzip \
    git \
    wget \
    cppad \
    python-matplotlib \ 
    python2.7-dev

ADD install_ipopt.sh .

RUN wget https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.7.zip && unzip Ipopt-3.12.7.zip && rm Ipopt-3.12.7.zip
RUN bash install_ipopt.sh Ipopt-3.12.7

RUN rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y  mesa-utils tmux vim sudo zsh