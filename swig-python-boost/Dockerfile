FROM debian:sid
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    g++ make swig libboost-python-dev pipx \
    && rm -rf /var/lib/apt/lists/* && pipx install cython \
    && pipx install pybind11 \
    && pipx install ipython \
    && pipx ensurepath 
  
CMD ["ipython"]
