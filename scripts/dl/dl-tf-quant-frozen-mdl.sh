#!/usr/bin/env bash

## Supported Frozen Quantized Topologies 
## The topologies hosted on the TensorFlow* Lite

CWD=${PWD}
DL_DIR=/workspace/nn_models/tf-quant-mdl

mkdir -p $DL_DIR && cd $DL_DIR

### Mobilenet V1 0.25 128 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.25_128_quant.tgz

### Mobilenet V1 0.25 160 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.25_160_quant.tgz

### Mobilenet V1 0.25 192 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.25_192_quant.tgz

### Mobilenet V1 0.25 224 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.25_224_quant.tgz

### Mobilenet V1 0.50 128 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.5_128_quant.tgz

### Mobilenet V1 0.50 160 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.5_160_quant.tgz

### Mobilenet V1 0.50 192 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.5_192_quant.tgz

### Mobilenet V1 0.50 224 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.5_224_quant.tgz

### Mobilenet V1 0.75 128 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.75_128_quant.tgz

### Mobilenet V1 0.75 160 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.75_160_quant.tgz

### Mobilenet V1 0.75 192 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.75_192_quant.tgz

### Mobilenet V1 0.75 224 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_0.75_224_quant.tgz

### Mobilenet V1 1.0 128 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_128_quant.tgz

### Mobilenet V1 1.0 160 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_160_quant.tgz

### Mobilenet V1 1.0 192 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_192_quant.tgz

### Mobilenet V1 1.0 224 ###
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz

### Mobilenet V2 1.0 224 ###
wget http://download.tensorflow.org/models/tflite_11_05_08/mobilenet_v2_1.0_224_quant.tgz

### Inception V1 ###
wget http://download.tensorflow.org/models/inception_v1_224_quant_20181026.tgz

### Inception V2 ###
wget http://download.tensorflow.org/models/inception_v2_224_quant_20181026.tgz

### Inception V3 ###
wget http://download.tensorflow.org/models/tflite_11_05_08/inception_v3_quant.tgz

### Inception V4 ###
wget http://download.tensorflow.org/models/inception_v4_299_quant_20181026.tgz

for targz in *.tgz
do 
  dir=$(basename ${targz} .tgz)
  mkdir -p $dir && tar -zxvf ${targz} -C $dir
done

rm -f *.tgz

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

