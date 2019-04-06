#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_hello_autoresize_classification_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/openvino-models/IR

${SAMPLE_BIN_DIR}/hello_autoresize_classification \
        ${IR_DIR}/classification/alexnet/caffe/alexnet.xml \
        ${TEST_SAMPLE_DIR}/cat.jpg \
        CPU



