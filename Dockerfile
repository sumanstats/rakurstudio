FROM debian:testing 
WORKDIR /
RUN apt-get update \
  && apt-get install -y gnupg git wget build-essential python3 python3-dev python3-setuptools python3-pip build-dep python3-matplotlib \
  bpython3 libatlas3-base libatlas-dev libatlas-base-dev liblapack-dev libblas-common libblas3 libblas-dev cython
  
RUN git clone https://github.com/numpy/numpy.git && cd numpy && pip3 install . 
RUN git clone https://github.com/ipython/ipython.git && cd ipython 

