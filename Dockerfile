FROM rocker/rstudio

RUN apt-get update \
  && apt-get install -y build-essential zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/rakudo/rakudo.git \
  && cd rakudo && perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar \
  && make && make install && cd .. && rm -rf rakudo \
  && apt-get auto-remove 


RUN git clone https://github.com/ugexe/zef.git && cd zef && perl6 -I. bin/zef install . && cd .. && rm -rf zef
ENV PATH /usr/share/perl6/site/bin:$PATH
RUN apt-get update \
  && zef install Linenoise 
