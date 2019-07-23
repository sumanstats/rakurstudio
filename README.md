# Perl 6, Rust and Tidyverse

[![Perl 6](https://img.shields.io/badge/Perl%206-2019.07-blue.svg?longCache=true&style=for-the-badge)](https://rakudo.perl6.org/downloads/star/)
[![Rust](https://img.shields.io/badge/Rust-1.36.0-green.svg?longCache=true&style=for-the-badge)](https://www.rust-lang.org/en-US/)
[![License: MIT](https://img.shields.io/github/license/sumandoc/rakurstudio.svg)](https://github.com/sumandoc/rakurstudio/blob/master/LICENSE)
[![Github Stars](https://img.shields.io/github/stars/sumandoc/P6RStudio.svg?style=social&label=Github)](https://github.com/sumandoc/rakurstudio)

This repository builds three images in DockerHub.


image            | description                               
---------------- | -----------------------------------------
[rakurstudio](https://hub.docker.com/r/sumankhanal/rakurstudio) | Docker image with [R](https://www.r-project.org/), [tidyverse](https://www.tidyverse.org/) and [Perl 6](https://perl6.org/) within [RStudio®](https://www.rstudio.com/) for reproducible work.
[rustrakurstudio](https://hub.docker.com/r/sumankhanal/rustrakurstudio) | Contains Rust and cargo in addition to the above image.
[swig-python-boost](https://hub.docker.com/r/sumankhanal/swig-python-boost) | Contains Python 3, pybind11 and Boost.Python for wrapping C/C++ libraries in Python but without RStudio.


[Rust](https://www.rust-lang.org/en-US/) and `cargo` will be useful in building R packages containing `rust` code.


## How to run this image?

To get **RStudio®** session with `Perl 6` go to the docker quickstart terminal and type:

+ `docker run -d -p 8787:8787 -v $PWD:/home/rstudio sumankhanal/rakurstudio` **OR** `docker run -d -p 8787:8787 -v $PWD:/home/rstudio sumankhanal/rustrakurstudio` which will mount current working directory to `/home/rstudio`   within container
+ Go to browser and type `docker_ip_address:8787`where you will be welcomed with `RStudio®` login screen
+ Type username: **rstudio**, password: **rstudio**

You are done!!

**Perl 6** is a powerful scripting, OOP and functional programming language with robust regex grammars.


## License ##

The Dockerfiles in this repository are licensed under MIT license.
