# Facerecognition YOLO

TBD What this image is about...

## Building the Image

    docker build -t facerecognition-yolo:dev .

## Publishing the Image

    docker tag facerecognition-yolo:dev fischerjulian/facerecognition-yolo:dev
    docker push fischerjulian/facerecognition-yolo:dev

As a one liner:

    docker build -t facerecognition-yolo:dev . && docker tag facerecognition-yolo:dev fischerjulian/facerecognition-yolo:dev && docker push fischerjulian/facerecognition-yolo:dev

## Running the Image

    docker run --rm -it --name facerecognition-yolo facerecognition-yolo bash

### Running the Face Recognition

Inside the container run:

    cd object-detection-opencv && python3 yolo_opencv.py --image /tmp/object_recognition/original-image.jpg --config yolov3.cfg --weights ../yolov3.weights --classes yolov3.txt 

This will produce output file: `/tmp/object_recognition/filtered-image.jpg`

## Downloading the YOLO Weights Definition

    wget https://pjreddie.com/media/files/yolov3.weights

## Links and Further Reading

* https://github.com/loretoparisi/docker/tree/master/darknet
* https://www.arunponnusamy.com/yolo-object-detection-opencv-python.html
