FROM debian:sid
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y g++ make ipython3 swig libboost-python-dev \
    cython3 python3-pybind11

CMD ["ipython3"]