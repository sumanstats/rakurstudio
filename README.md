# Raku, Rust and Tidyverse

[![Raku](https://img.shields.io/badge/Raku-2019.07-blue.svg?longCache=true&style=for-the-badge)](https://rakudo.org/files/star)
[![Rust](https://img.shields.io/badge/Rust-1.37.0-green.svg?longCache=true&style=for-the-badge)](https://www.rust-lang.org/en-US/)
[![License: MIT](https://img.shields.io/github/license/sumanstats/rakurstudio.svg)](https://github.com/sumanstats/rakurstudio/blob/master/LICENSE)
[![Github Stars](https://img.shields.io/github/stars/sumandoc/P6RStudio.svg?style=social&label=Github)](https://github.com/sumanstats/rakurstudio)

This repository builds three images in DockerHub.


image            | description                               
---------------- | -----------------------------------------
[rakurstudio](https://hub.docker.com/r/sumankhanal/rakurstudio) | Docker image with [R](https://www.r-project.org/), [tidyverse](https://www.tidyverse.org/) and [Raku](https://raku.org/) within [RStudio®](https://www.rstudio.com/) for reproducible work.
[rustrakurstudio](https://hub.docker.com/r/sumankhanal/rustrakurstudio) | Contains Rust and cargo in addition to the above image.
[swig-python-boost](https://hub.docker.com/r/sumankhanal/swig-python-boost) | Contains Python 3, pybind11 and Boost.Python for wrapping C/C++ libraries in Python but without RStudio.


[Rust](https://www.rust-lang.org/en-US/) and `cargo` will be useful in building R packages containing `rust` code.


## How to run this image?

To get **RStudio®** session with `Raku` go to the docker quickstart terminal and type:

+ `docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere -v $PWD:/home/rstudio sumankhanal/rakurstudio` **OR** `docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere -v $PWD:/home/rstudio sumankhanal/rustrakurstudio` which will mount current working directory to `/home/rstudio`   within container
+ Visit `docker_ip_address:8787` in your browser and log in with username **rstudio** and the password you set. **NB: Setting a password is now REQUIRED**. Container will error otherwise.


You are done!!

**Raku** is a powerful scripting, OOP and functional programming language with robust regex grammars.


## License ##

The Dockerfiles in this repository are licensed under MIT license.
