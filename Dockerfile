FROM rocker/rstudio
ENV RAKUDO=2019.07
ENV PATH=$PATH:/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/site/bin


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/nxadm/rakudo-pkg/releases/download/v${RAKUDO}/rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && dpkg -i rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Rprofile.site \
    && echo "export PATH" >> /usr/local/lib/R/etc/Rprofile.site \
    && rm rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
    && zef install App::Mi6
