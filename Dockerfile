# FROM sumdoc/python3.7
# WORKDIR /
# 
# RUN apt-get update \
#   && apt-get install -y wget libpng-dev gfortran libgfortran-6-dev apt-utils dialog musl libatlas-base-dev libopenblas-dev \
#   libopenblas-base imagemagick qt5-default qtbase5-dev libjpeg62-turbo-dev liblcms2-dev \
#   libwebp-dev libtiff-tools libtiff5-dev libffi-dev libjpeg-turbo-progs \
#   libfribidi-dev cmake qtdeclarative5-dev qttools5-dev-tools qtmultimedia5-dev \
#   libqt5svg5 libqtwebkit-dev libqt5webengine5 qml-module-qt-websockets libqt5bluetooth5 \
#   libqt5nfc5 qtwebengine5-dev libqt5x11extras5 libqt5serialport5 && rm -rf /var/lib/apt/lists/*
# 
# 
# #Install sip and pyqt5
# 
# RUN wget https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.3/sip-4.19.3.tar.gz \
#   && tar -zxvf sip-4.19.3.tar.gz && cd sip-4.19.3 && python3 configure.py && make && make install && cd .. && rm -rf sip* \
#   && wget https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.9/PyQt5_gpl-5.9.tar.gz \
#   && tar -zxvf PyQt5_gpl-5.9.tar.gz && cd PyQt5_gpl-5.9 && python3 configure.py --confirm-license && make && make install \
#   && cd .. && rm -rf PyQt* 
# 
# RUN pip3 install python-dateutil Cython pytz cycler six nose sphinx pillow pytest cffi --no-cache-dir 
# 
# 
# 
# 
# # Installing numpy
# RUN git clone https://github.com/numpy/numpy.git && cd numpy && python3 setup.py config_fc --fcompiler=gnu95 install \
#   && cd .. && rm -rf numpy
# 
# 
# 
# # Installing scipy 
# RUN git clone https://github.com/scipy/scipy.git && cd scipy && git clean -xdf \ 
#   && python3 setup.py config_fc --fcompiler=gnu95 install && cd .. && rm -rf scipy 
# 
# # Installing matplotlib
# RUN git clone https://github.com/matplotlib/matplotlib.git && cd matplotlib && python3 setup.py build \
#   && python3 setup.py install && cd .. && rm -rf matplot* && pip3 install jupyter notebook --no-cache-dir
#   
# # command
#   
# CMD ["python3","--version"]






FROM rocker/verse 

RUN apt-get update \
  && apt-get install -y build-essential \
  git nano libzmq3-dev libreadline-dev ca-certificates\
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/rakudo/rakudo.git \
  && cd rakudo && perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar \
  && make && make install && cd .. && rm -rf rakudo
  


RUN git clone https://github.com/ugexe/zef.git && cd zef && perl6 -I. bin/zef install . && cd .. && rm -rf zef
ENV PATH /usr/share/perl6/site/bin:$PATH
RUN apt-get update \
  && zef install Linenoise

