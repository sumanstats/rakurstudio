FROM rocker/verse:latest
ENV RAKUDO=2018.10

LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl \
&& rm -rf /var/lib/apt/lists/* \
&& wget https://rakudo.org/dl/star/rakudo-star-${RAKUDO}.tar.gz \
&& tar -xvzf rakudo-star-${RAKUDO}.tar.gz \
&& cd rakudo-star-${RAKUDO} \
&& perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
&& make && make install \
&& cd .. && rm -rf rakudo-star-${RAKUDO}.tar.gz rakudo-star-${RAKUDO} \
&& ln -s /usr/share/perl6/site/bin/* /usr/local/bin \
&& zef install App::Mi6 \
&& ln -sf /usr/share/perl6/site/bin/* /usr/local/bin \
&& apt-get auto-remove 
