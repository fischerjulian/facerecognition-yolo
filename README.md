# Facerecognition YOLO

TBD What this image is about...

## Building the Image

    docker build -t facerecognition-yolo .

## Publishing the Image

    docker tag <image-id> <registry-username>/facerecognition-yolo:<tag: v0.1>
    docker push <registry-useername>/facerecognition-yolo

After publishing your image to the registry you can also use it in your Kubernetes cluster / Argo workflows.

## Running the Image

    docker run --rm -it --name facerecognition-yolo facerecognition-yolo bash

### Running Darknet Face Recognition

Inside the container run:

    cd object-detection-opencv && python3 yolo_opencv.py --image /tmp/original-image.jpg --config yolov3.cfg --weights ../yolov3.weights --classes yolov3.txt 

## Links and Further Reading

* https://github.com/loretoparisi/docker/tree/master/darknet
* https://www.arunponnusamy.com/yolo-object-detection-opencv-python.html
