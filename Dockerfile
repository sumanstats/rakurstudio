FROM rocker/rstudio
ENV RAKUDO=2020.05.1
ENV PATH=$PATH:/usr/share/perl6/site/bin


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl libgsl23 libgsl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir rakudo \
    && wget -O rakudo.tar.gz https://github.com/rakudo/rakudo/releases/download/${RAKUDO}/rakudo-${RAKUDO}.tar.gz \
    && tar xzf rakudo.tar.gz --strip-components=1 -C rakudo \
    && ( \
        cd rakudo \
        && perl Configure.pl --prefix=/usr --gen-moar --backends=moar \
        && make && make install \
    ) \
    && rm -rf rakudo rakudo.tar.gz \
    && git clone https://github.com/ugexe/zef.git \
    && cd zef \
    && raku -I. bin/zef install . && cd .. && rm -rf zef \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
    && zef install Linenoise App::Mi6 Pod::To::HTML \
    && ln -s /usr/share/perl6/site/bin/* /usr/local/bin
