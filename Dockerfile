FROM debian:testing 
WORKDIR /
RUN apt-get update \
  && apt-get install -y gnupg git wget build-essential python3 python3-dev python3-setuptools python3-pip \
  libatlas3-base libatlas-dev libatlas-base-dev liblapack-dev libblas-common libblas3 libblas-dev cython
  
RUN git clone https://github.com/numpy/numpy.git
WORKDIR /numpy

RUN python3 setup.py build --fcompiler=gnu95 install 
RUN pip3 install nose
RUN git clone https://github.com/ipython/ipython.git 
WORKDIR /numpy/ipython
RUN python3 setup.py install && cd .. && rm -rf ipython
WORKDIR /
CMD ["python3", "/numpy/numpy/tests/test_ctypeslib.py"]
