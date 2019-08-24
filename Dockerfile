FROM rocker/rstudio
ENV RAKUDO=2019.07
ENV PATH=$PATH:/usr/share/perl6/site/bin


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir rakudo \
    && wget -O rakudo.tar.gz https://github.com/rakudo/rakudo/releases/download/${RAKUDO}.1/rakudo-${RAKUDO}.1.tar.gz \
    && tar xzf rakudo.tar.gz --strip-components=1 -C rakudo \
    && ( \
        cd rakudo \
        && perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
        && make && make install \
    ) \
    && rm -rf rakudo rakudo.tar.gz \
    && git clone https://github.com/ugexe/zef.git \
    && cd zef \
    && perl6 -I. bin/zef install . && cd .. && rm -rf zef \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
    && zef install Linenoise App::Mi6
