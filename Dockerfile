FROM debian:testing 
WORKDIR /
RUN apt-get update \
  && apt-get install -y gnupg git wget build-essential python3 python3-dev libatlas3-base \
  libatlas-dev libatlas-base-dev libblas3 libblas-dev cython
  
RUN git clone https://github.com/numpy/numpy.git
