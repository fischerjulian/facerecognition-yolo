FROM ubuntu:18.04

LABEL maintainer="julian.fischer@anynines.com"
LABEL description="Facerecognition using (Darnket) Yolo Weights."

RUN mkdir /workdir

WORKDIR /workdir

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installation
RUN apt-get update && apt-get -y install --no-install-recommends \
  pkg-config \
  apt-utils \
  autoconf \
  automake \
  libtool \
  build-essential \
  git \
  python3 python3-numpy python3-setuptools python3-pip\
  libopencv-dev opencv-data

COPY yolov3.weights /workdir/yolov3.weights

RUN pip3 install opencv-python

RUN git clone https://github.com/arunponnusamy/object-detection-opencv

# Overwrite
COPY yolo_opencv.py /workdir/object-detection-opencv/yolo_opencv.py

# Provide an exemplary origina-file for, mainly for manual testing.
RUN cp /workdir/object-detection-opencv/dog.jpg /tmp/original-image.jpg

# Recommended CMD
# cd object-detection-opencv && python3 yolo_opencv.py --image /tmp/original-image.jpg --config yolov3.cfg --weights ../yolov3.weights --classes yolov3.txt 

CMD ["bash"]