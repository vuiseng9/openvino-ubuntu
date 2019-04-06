#!/usr/bin/env bash

# https://docs.openvinotoolkit.org/latest/_inference_engine_samples_mask_rcnn_demo_README.html

SAMPLE_BIN_DIR=~/inference_engine_samples_build/intel64/Release
TEST_SAMPLE_DIR=/workspace/openvino-ubuntu/test_samples
IR_DIR=/workspace/openvino-models/IR

${SAMPLE_BIN_DIR}/mask_rcnn_demo \
        -i ${TEST_SAMPLE_DIR}/coco_val2017_000000388258.jpg \
        -m ${IR_DIR}/tf-obj-det/mask_rcnn_inception_v2_coco_2018_01_28/frozen_inference_graph.xml \
        -d CPU -pc



