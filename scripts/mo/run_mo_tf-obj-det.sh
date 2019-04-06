#!/usr/bin/env bash

OUTROOT=/workspace/openvino-models/IR
MO_SCRIPT=${INTEL_CVSDK_DIR}/deployment_tools/model_optimizer/mo_tf.py


# https://docs.openvinotoolkit.org/latest/_docs_MO_DG_prepare_model_convert_model_tf_specific_Convert_Object_Detection_API_Models.html

outdir=$OUTROOT/tf-obj-det/ssd_inception_v2_coco_2018_01_28 && mkdir -p $outdir
cd /workspace/openvino-models/tf-obj-det/ssd_inception_v2_coco_2018_01_28 &&
         python3 $MO_SCRIPT --input_model frozen_inference_graph.pb \
                            --tensorflow_use_custom_operations_config $INTEL_CVSDK_DIR/deployment_tools/model_optimizer/extensions/front/tf/ssd_v2_support.json \
                            --tensorflow_object_detection_api_pipeline_config pipeline.config \
                            --reverse_input_channels \
                            --output_dir $outdir


# https://docs.openvinotoolkit.org/latest/_docs_MO_DG_prepare_model_convert_model_tf_specific_Convert_Object_Detection_API_Models.html
outdir=$OUTROOT/tf-obj-det/mask_rcnn_inception_v2_coco_2018_01_28 && mkdir -p $outdir
cd /workspace/openvino-models/tf-obj-det/mask_rcnn_inception_v2_coco_2018_01_28 &&
         python3 $MO_SCRIPT --input_model frozen_inference_graph.pb \
                            --tensorflow_use_custom_operations_config $INTEL_CVSDK_DIR/deployment_tools/model_optimizer/extensions/front/tf/mask_rcnn_support.json \
                            --tensorflow_object_detection_api_pipeline_config pipeline.config \
                            --reverse_input_channels \
                            --output_dir $outdir

