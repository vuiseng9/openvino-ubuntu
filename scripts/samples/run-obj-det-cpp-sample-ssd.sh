#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_object_detection_sample_ssd_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
# IR_DIR=/workspace/nn_models/IR

${SAMPLE_BIN_DIR}/object_detection_sample_ssd \
        -i ${TEST_SAMPLE_DIR}/pedestrains.jpg \
        -m /workspace/nn_models/Retail/object_detection/pedestrian/rmnet_ssd/0013/dldt/person-detection-retail-0013.xml \
        -d CPU -pc



