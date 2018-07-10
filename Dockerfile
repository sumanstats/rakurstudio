FROM rocker/verse:latest
ENV RAKUDO=2018.04

LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"

#WORKDIR /
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    libzmq3-dev curl imagemagick python3-pip \
#    && pip3 install wheel setuptools --no-cache-dir \
#    && pip3 install asciinema --no-cache-dir \
#    && rm -rf /var/lib/apt/lists/* 



RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://rakudo.org/dl/star/rakudo-star-${RAKUDO}.tar.gz \
    && tar -xvzf rakudo-star-${RAKUDO}.tar.gz \
    && cd rakudo-star-${RAKUDO} \
    && perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
    && make && make install \
    && cd .. && rm -rf rakudo-star-${RAKUDO}.tar.gz rakudo-star-${RAKUDO} \
    && export PATH=/usr/bin:/usr/share/perl6/site/bin:$PATH \
    && zef install App::Mi6 \
    && apt-get auto-remove \
    && rm /etc/profile
 
ADD profile /etc/profile