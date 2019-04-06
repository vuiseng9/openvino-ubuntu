#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_benchmark_app_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/openvino-models/IR

${SAMPLE_BIN_DIR}/benchmark_app \
        -i ${TEST_SAMPLE_DIR}/cat.jpg \
        -m ${IR_DIR}/classification/resnet/v1/50/caffe/resnet-50.xml \
        -d CPU -api async

