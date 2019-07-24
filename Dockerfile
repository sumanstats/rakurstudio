FROM rocker/rstudio
ENV RAKUDO=2019.07
ENV PATH=~/.perl6/bin:/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/site/bin:$PATH


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN wget https://github.com/nxadm/rakudo-pkg/releases/download/v${RAKUDO}/rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && dpkg -i rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && echo "PATH=~/.perl6/bin:/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/site/bin:$PATH" >> /usr/local/lib/R/etc/Rprofile.site \
    && echo "export PATH" >> /usr/local/lib/R/etc/Rprofile.site \
    && rm rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
    && ln -s /opt/rakudo-pkg/bin/* /usr/local/bin \
    && zef install App::Mi6
