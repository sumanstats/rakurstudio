FROM sumdoc/python3.7
WORKDIR /

RUN apt-get update \
  && apt-get install -y wget libatlas-base-dev libopenblas-base libfreetype6 libfreetype6-dev \
  imagemagick ffmpeg qtbase5-dev qt5-default 
  
  
RUN apt-get install -y libjpeg62-turbo-dev netpbm liblcms2-dev \
  libwebp-dev libtiff-tools libtiff5-dev libharfbuzz-dev libffi-dev libjpeg-turbo-progs \
  libfribidi-dev pkg-config ghostscript cmake && apt-get clean


#Install sip and pyqt5

RUN pip3 install python-dateutil Cython pytz cycler six nose sphinx pillow pytest cffi ipython



# Installing numpy 
RUN git clone https://github.com/numpy/numpy.git && cd numpy && python setup.py build --fcompiler=gnu95 install


# Installing scipy 
RUN git clone https://github.com/scipy/scipy.git & cd scipy && git clean -xdf \ 
  && python setup.py config_fc --fcompiler=gnu95 install

# Installing matplotlib
RUN git clone https://github.com/matplotlib/matplotlib.git && cd matplotlib && python3 setup.py build \
  && python3 setup.py install
  
CMD ["ipython"]
