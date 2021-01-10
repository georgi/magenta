FROM tensorflow/tensorflow:2.4.0-gpu-jupyter

RUN apt-get update
RUN apt-get -y install libsndfile-dev libfluidsynth1 build-essential libasound2-dev libjack-dev fluid-soundfont-gm ffmpeg

RUN pip3 uninstall -y enum34
RUN pip3 install magenta numba==0.48.0 sndfile apache_beam dill==0.3.2 gsutil pyfluidsynth pretty_midi 