#!/usr/bin/env bash

### Supported Unfrozen Topologies with Links 
### to the Associated Slim Model Classification Download Files</b></p>

# Detailed information on how to convert models from the
#   https://github.com/tensorflow/models/tree/master/research/slim/README.md

CWD=${PWD}
DL_DIR=/hosthome/nn_models/tfslim-pre-freeze

mkdir -p $DL_DIR && cd $DL_DIR

### Inception v1 ###

wget http://download.tensorflow.org/models/inception_v1_2016_08_28.tar.gz
### Inception v2 ###

wget http://download.tensorflow.org/models/inception_v1_2016_08_28.tar.gz
### Inception v3 ###

wget http://download.tensorflow.org/models/inception_v3_2016_08_28.tar.gz
### Inception V4 ###

wget http://download.tensorflow.org/models/inception_v4_2016_09_09.tar.gz
### Inception ResNet v2 ###

wget http://download.tensorflow.org/models/inception_resnet_v2_2016_08_30.tar.gz
### MobileNet v1 128 ###

wget http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_0.25_128.tgz
### MobileNet v1 160 ###

wget http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_0.5_160.tgz
### MobileNet v1 224 ###

wget http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz
### NasNet Large ###

wget https://storage.googleapis.com/download.tensorflow.org/models/nasnet-a_large_04_10_2017.tar.gz
### NasNet Mobile ###

wget https://storage.googleapis.com/download.tensorflow.org/models/nasnet-a_mobile_04_10_2017.tar.gz
### ResidualNet-50 v1 ###

wget http://download.tensorflow.org/models/resnet_v1_50_2016_08_28.tar.gz
### ResidualNet-50 v2 ###

wget http://download.tensorflow.org/models/resnet_v2_50_2017_04_14.tar.gz
### ResidualNet-101 v1 ###

wget http://download.tensorflow.org/models/resnet_v1_101_2016_08_28.tar.gz
### ResidualNet-101 v2 ###

wget http://download.tensorflow.org/models/resnet_v2_101_2017_04_14.tar.gz
### ResidualNet-152 v1 ###

wget http://download.tensorflow.org/models/resnet_v1_152_2016_08_28.tar.gz
### ResidualNet-152 v2 ###

wget http://download.tensorflow.org/models/resnet_v2_152_2017_04_14.tar.gz
### VGG-16 ###

wget http://download.tensorflow.org/models/vgg_16_2016_08_28.tar.gz
### VGG-19 ###

wget http://download.tensorflow.org/models/vgg_19_2016_08_28.tar.gz


for targz in *.tar.gz
do
  dir=$(basename ${targz} .tar.gz)
  mkdir -p $dir && tar -xzf ${targz} -C $dir
done

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

rm -f *.tar.gz

cd $CWD

