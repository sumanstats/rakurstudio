FROM rocker/tidyverse


ENV RAKUDO=2018.04

ARG BUILD_DATE 


LABEL org.label-schema.build-date=$BUILD_DATE \
      maintainer="Dr Suman Khanal <suman81765@gmail.com>"

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
    git nano libzmq3-dev libssl-dev curl wget imagemagick asciinema \
    && rm -rf /var/lib/apt/lists/* \
    && wget http://rakudo.org/downloads/star/rakudo-star-${RAKUDO}.tar.gz \
    && tar -xvzf rakudo-star-${RAKUDO}.tar.gz \
    && cd rakudo-star-${RAKUDO} \
    && perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
    && make && make install \
    && cd .. && rm -rf rakudo-star-${RAKUDO} \
    && export PATH=/usr/bin:/usr/share/perl6/site/bin:$PATH \
    && zef install App::Mi6 \
    && apt-get auto-remove
    
    
ENV PATH $PATH:/usr/bin:/usr/share/perl6/site/bin 
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y
ENV PATH $PATH:$HOME/.cargo/bin
