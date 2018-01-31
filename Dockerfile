FROM rocker/verse:devel

MAINTAINER Suman Khanal <suman81765@gmail.com> 
ENV RAKUDO=2018.01

#ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git nano libzmq3-dev ca-certificates libssl-dev curl wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget http://rakudo.org/downloads/star/rakudo-star-${RAKUDO}.tar.gz \
    && tar -xvzf rakudo-star-${RAKUDO}.tar.gz \
    && cd rakudo-star-${RAKUDO} \
    && perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
    && make && make install \
    && cd .. && rm -rf rakudo-star-${RAKUDO} \
    && export PATH=/usr/bin:/usr/share/perl6/site/bin:$PATH \
    && zef install App::Mi6 \
    && apt-get --auto-remove
    
    
ENV PATH $PATH:/usr/bin:/usr/share/perl6/site/bin 
