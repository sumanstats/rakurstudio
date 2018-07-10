# Perl 6, Rust and Tidyverse

[![Perl 6](https://img.shields.io/badge/Perl%206-2018.04-blue.svg)](https://rakudo.perl6.org/downloads/star/)
[![Rust](https://img.shields.io/badge/Rust-1.27.0-green.svg)](https://www.rust-lang.org/en-US/)
[![License: MIT](https://img.shields.io/github/license/sumandoc/P6RStudio.svg)](https://github.com/sumandoc/P6RStudio/blob/master/LICENSE)
[![Github Stars](https://img.shields.io/github/stars/sumandoc/P6RStudio.svg?style=social&label=Github)](https://github.com/sumandoc/P6RStudio)

This repository builds three images in DockerHub.


image            | description                               
---------------- | -----------------------------------------
[p6rstudio](https://hub.docker.com/r/sumdoc/p6rstudio/) | Docker image with [R](https://www.r-project.org/), [tidyverse](https://www.tidyverse.org/) and [Perl 6](https://perl6.org/) within [RStudio®](https://www.rstudio.com/) for reproducible work.
[rustp6rstudio](https://hub.docker.com/r/sumdoc/rustp6rstudio/) | Contains Rust and cargo in addition to the above image.
[swig-python-boost](https://hub.docker.com/r/sumdoc/swig-python-boost/) | Contains Python 3, pybind11 and Boost.Python for wrapping C/C++ libraries in Python but without RStudio.


[Rust](https://www.rust-lang.org/en-US/) and `cargo` will be useful in building R packages containing `rust` code.

**Note !!** Though installed, I couldn't access rust inside R. Something to do with user permissions. So I am still searching how to do. Any help would be appreciated on this regard.

## How to run this image?

To get **RStudio®** session with `Perl 6` go to the docker quickstart terminal and type:

+ `docker run -d -p 8787:8787 -v $PWD:/home/rstudio sumdoc/p6rstudio` **OR** `docker run -d -p 8787:8787 -v $PWD:/home/rstudio sumdoc/rustp6rstudio` which will mount current working directory to `/home/rstudio`   within container
+ Go to browser and type `docker_ip_address:8787`where you will be welcomed with `RStudio®` login screen
+ Type username: **rstudio**, password: **rstudio**

You are done!!

**Perl 6** is a powerful scripting, OOP and functional language with robust regex grammars.


## License ##

The Dockerfiles in this repository are licensed under MIT license.
