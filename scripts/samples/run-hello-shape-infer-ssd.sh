#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_hello_shape_infer_ssd_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/openvino-models/IR

${SAMPLE_BIN_DIR}/hello_shape_infer_ssd \
        ${IR_DIR}/object_detection/common/ssd/300/caffe/ssd300.xml \
        ${TEST_SAMPLE_DIR}/pedestrains.jpg \
        CPU 3



