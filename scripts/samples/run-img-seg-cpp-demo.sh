#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_segmentation_demo_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/nn_models/IR

${SAMPLE_BIN_DIR}/segmentation_demo \
        -i ${TEST_SAMPLE_DIR}/cityscapes_frankfurt_000001_083199_leftImg8bit.png \
        -m ${IR_DIR}/semantic_segmentation/dilation/cityscapes/caffe/dilation.xml \
        -d CPU -pc



