#!/usr/bin/env bash

# Supported Frozen Topologies from TensorFlow Object Detection Models Zoo
# https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md

CWD=${PWD}
DL_DIR=/hosthome/nn_models/tf-obj-det

mkdir -p $DL_DIR && cd $DL_DIR

### SSD MobileNet V1 COCO* ###
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz

### SSD MobileNet V1 0.75 Depth COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_0.75_depth_300x300_coco14_sync_2018_07_03.tar.gz

### SSD MobileNet V1 PPN COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_ppn_shared_box_predictor_300x300_coco14_sync_2018_07_03.tar.gz

### SSD MobileNet V1 FPN COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_fpn_shared_box_predictor_640x640_coco14_sync_2018_07_03.tar.gz

### SSD ResNet50 FPN COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_resnet50_v1_fpn_shared_box_predictor_640x640_coco14_sync_2018_07_03.tar.gz

### SSD MobileNet V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v2_coco_2018_03_29.tar.gz

### SSD Lite MobileNet V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/ssdlite_mobilenet_v2_coco_2018_05_09.tar.gz

### SSD Inception V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/ssd_inception_v2_coco_2018_01_28.tar.gz

### RFCN ResNet 101 COCO ###
wget http://download.tensorflow.org/models/object_detection/rfcn_resnet101_coco_2018_01_28.tar.gz

### Faster R-CNN Inception V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_v2_coco_2018_01_28.tar.gz

### Faster R-CNN ResNet 50 COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet50_coco_2018_01_28.tar.gz

### Faster R-CNN ResNet 50 Low Proposals COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet50_lowproposals_coco_2018_01_28.tar.gz

### Faster R-CNN ResNet 101 COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet101_coco_2018_01_28.tar.gz

### Faster R-CNN ResNet 101 Low Proposals COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet101_lowproposals_coco_2018_01_28.tar.gz

### Faster R-CNN Inception ResNet V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz

### Faster R-CNN Inception ResNet V2 Low Proposals COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_lowproposals_coco_2018_01_28.tar.gz

### Faster R-CNN NasNet COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_nas_coco_2018_01_28.tar.gz

### Faster R-CNN NasNet Low Proposals COCO ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_nas_lowproposals_coco_2018_01_28.tar.gz

### Mask R-CNN Inception ResNet V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/mask_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz

### Mask R-CNN Inception V2 COCO ###
wget http://download.tensorflow.org/models/object_detection/mask_rcnn_inception_v2_coco_2018_01_28.tar.gz

### Mask R-CNN ResNet 101 COCO ###
wget http://download.tensorflow.org/models/object_detection/mask_rcnn_resnet101_atrous_coco_2018_01_28.tar.gz

### Mask R-CNN ResNet 50 COCO ###
wget http://download.tensorflow.org/models/object_detection/mask_rcnn_resnet50_atrous_coco_2018_01_28.tar.gz

### Faster R-CNN ResNet 101 Kitti* ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet101_kitti_2018_01_28.tar.gz

### Faster R-CNN Inception ResNet V2 Open Images* ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_oid_2018_01_28.tar.gz

### Faster R-CNN Inception ResNet V2 Low Proposals Open Images* ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_lowproposals_oid_2018_01_28.tar.gz

### Faster R-CNN ResNet 101 AVA v2.1* ###
wget http://download.tensorflow.org/models/object_detection/faster_rcnn_resnet101_ava_v2.1_2018_04_30.tar.gz

for targz in *.tar.gz
do 
  dir=$(basename ${targz} .tar.gz)
  mkdir -p $dir && tar -xzf ${targz} -C $dir
done

rm -f *.tar.gz

function rm_duplicate_dir() {
  for filepath in "$1"/*
  do
      if [ -d ${filepath} ] ; then
          # echo "current: $filepath"
          dirs=(${filepath//// })

          if [ ${dirs[-1]} == ${dirs[-2]} ] ; then
              echo "[Info]: Duplicated Found => ${dirs[-1]} == ${dirs[-2]}"
              abspath=$(realpath $filepath)
              absdir=$(dirname $abspath)
              mv $abspath/* $absdir/. && rm -rf $abspath
          fi
          rm_duplicate_dir "${filepath}"
      fi
  done
}

rm_duplicate_dir ./

cd $CWD
