## Python 3 with pybind11 and Boost.Python


This image contains [pybind11](https://github.com/pybind/pybind11), [SWIG (Simplified Wrapper and Interface Generator)](http://www.swig.org/), [Boost.Python](https://www.boost.org/doc/libs/1_78_0/libs/python/doc/html/index.html) and [cython](http://cython.org/) along with Python 3.


## How to run the image?


Keep all your `.c` or `.cpp` files in a separate folder. Go inside that directory in `PowerShell` in Windows and run this command:
`docker run -it  --rm -v ${PWD}:/home -w /home sumankhanal/swig-python-boost /bin/bash`.


What it essentially does is mount your host directory `${PWD}` containing C/C++ files into `/home` directory of container and this `/home` directory will be your working directory in the container with all the C/C++ files.



See one walkthrough [using cython here.](https://medium.com/@shamir.stav_83310/making-your-c-library-callable-from-python-by-wrapping-it-with-cython-b09db35012a3)
