#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_classification_sample_async_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/openvino-models/IR

${SAMPLE_BIN_DIR}/classification_sample_async \
        -m ${IR_DIR}/classification/alexnet/caffe/alexnet.xml \
        -i ${TEST_SAMPLE_DIR}/cat.jpg \
        -nt 5 -d HETERO:GPU,CPU -nireq 2 -ni 200 -pc



