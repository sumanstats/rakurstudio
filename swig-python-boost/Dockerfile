FROM debian:sid
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    g++ make swig libboost-python-dev python3-pybind11 \
    pybind11-dev cython3 ipython3 \
    && rm -rf /var/lib/apt/lists/*
    
CMD ["ipython3"]
