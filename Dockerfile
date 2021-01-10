FROM tensorflow/tensorflow:2.1.2-gpu-jupyter

RUN apt-get -y install libsndfile-dev

RUN pip3 uninstall -y enum34
RUN pip3 install magenta numba==0.48.0 sndfile apache_beam dill==0.3.2 tensorflow-probability==0.7.0