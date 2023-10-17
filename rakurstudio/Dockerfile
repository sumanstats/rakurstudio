FROM rocker/rstudio@sha256:1088050ccd068827aba5ee598284b410f4514f24f1afa543788c670fde900429
ENV RAKUDO=2023.09
ENV PATH=$PATH:/usr/share/perl6/site/bin


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl \
    libgsl27 libgsl-dev \ 
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
    && zef install Linenoise \ 
    && ln -s /usr/share/perl6/site/bin/* /usr/local/bin
    # don't install App::Mi6 Pod::To::HTML as its failing
    # if GNU GSL required install libgsl23 libgsl-dev 
