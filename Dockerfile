FROM tensorflow/tensorflow:2.0.0a0-gpu-py3-jupyter

RUN pip3 uninstall -y enum34
RUN pip3 install magenta