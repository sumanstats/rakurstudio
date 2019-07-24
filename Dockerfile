FROM rocker/rstudio
ENV RAKUDO=2019.07

LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/nxadm/rakudo-pkg/releases/download/v${RAKUDO}/rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && dpkg -i rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && bash /opt/rakudo-pkg/bin/add-perl6-to-path \
    && source /root/.profile \
    && rm rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && zef install App::Mi6
