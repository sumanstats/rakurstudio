# Perl 6, R and Tidyverse in RStudio

[![Perl 6](https://img.shields.io/badge/Perl%206-2018.01-blue.svg)](https://rakudo.perl6.org/downloads/star/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![](https://images.microbadger.com/badges/image/sumdoc/p6rstudio.svg)](https://microbadger.com/images/sumdoc/p6rstudio "Get your own image badge on microbadger.com")
[![Github Stars](https://img.shields.io/github/stars/sumandoc/P6RStudio.svg?style=social&label=Github)](https://github.com/sumandoc/P6RStudio)

Docker image with [R](https://www.r-project.org/), [tidyverse](https://www.tidyverse.org/) and [Perl 6](https://perl6.org/) within RStudio for reproducible work. Also contains [ImageMagick®](https://www.imagemagick.org/script/index.php) for image manipulation.


## How to run this image?

To get **RStudio** session with `Perl 6` go to the docker quickstart terminal and type:

+ `docker run -d -p 8787:8787 -v $PWD:/home/rstudio sumdoc/p6rstudio` which will mount current working directory to `/home/rstudio` within container
+ Go to browser and type `docker_ip_address:8787`where you will be welcomed with `RStudio` login screen
+ Type username: **rstudio**, password: **rstudio**

You are done!!

Get involved in your research with **Perl 6** as a powerful scripting, OOP and functional language with awesome regex grammars.


