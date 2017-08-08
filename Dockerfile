FROM sumdoc/python3.7
WORKDIR /

RUN apt-get update \
  && apt-get install -y libpng-dev gfortran libgfortran-6-dev musl libatlas-base-dev libopenblas-dev \
  libopenblas-base imagemagick qt5-default qtbase5-dev libjpeg62-turbo-dev liblcms2-dev \
  libwebp-dev libtiff-tools libtiff5-dev libffi-dev libjpeg-turbo-progs \
  libfribidi-dev cmake && apt-get clean


#Install sip and pyqt5

RUN pip3 install python-dateutil Cython pytz cycler six nose sphinx pillow pytest cffi 




# Installing numpy
RUN git clone https://github.com/numpy/numpy.git && cd numpy && python3 setup.py config_fc --fcompiler=gnu95 install



# Installing scipy 
RUN git clone https://github.com/scipy/scipy.git && cd scipy && git clean -xdf \ 
  && python3 setup.py config_fc --fcompiler=gnu95 install

# Installing matplotlib
RUN git clone https://github.com/matplotlib/matplotlib.git && cd matplotlib && python3 setup.py build \
  && python3 setup.py install
  
CMD ["python","--version"]
