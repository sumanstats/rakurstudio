FROM rocker/rstudio


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update \
    && wget https://github.com/nxadm/rakudo-pkg/releases/download/v2019.07/rakudo-pkg-Debian9_2019.07-01_amd64.deb \
    && dpkg -i rakudo-pkg-Debian9_2019.07-01_amd64.deb \
    && bash /opt/rakudo-pkg/bin/add-perl6-to-path && source /root/.profile \
    && rm rakudo-pkg-Debian9_2019.07-01_amd64.deb \
    && zef install App::Mi6
