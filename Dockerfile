FROM rocker/verse

RUN apt-get update \
  && apt-get install -y \
  nano libzmq3-dev \
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/rakudo/rakudo.git \
  && cd rakudo && perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar \
  && make && make install && cd .. && rm -rf rakudo \
  && git clone https://github.com/ugexe/zef.git && cd zef && perl6 -I. bin/zef install . \
  && cd .. && rm -rf zef \
  && export PATH=$PATH:/usr/share/perl6/site/bin \
  && zef install Linenoise \
  && apt-get autoremove
  
  #--no-install-recommends


ENV PATH /usr/share/perl6/site/bin:$PATH
