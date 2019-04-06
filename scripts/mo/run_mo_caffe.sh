#!/usr/bin/env bash

OUTROOT=/workspace/openvino-models/IR
MO_SCRIPT=${INTEL_CVSDK_DIR}/deployment_tools/model_optimizer/mo_caffe.py

outdir=$OUTROOT/./classification/alexnet/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/alexnet/caffe && 
	 python3 $MO_SCRIPT --input_proto alexnet.prototxt --input_model alexnet.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/densenet/121/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/densenet/121/caffe && 
	 python3 $MO_SCRIPT --input_proto densenet-121.prototxt --input_model densenet-121.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/densenet/161/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/densenet/161/caffe && 
	 python3 $MO_SCRIPT --input_proto densenet-161.prototxt --input_model densenet-161.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/densenet/169/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/densenet/169/caffe && 
	 python3 $MO_SCRIPT --input_proto densenet-169.prototxt --input_model densenet-169.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/densenet/201/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/densenet/201/caffe && 
	 python3 $MO_SCRIPT --input_proto densenet-201.prototxt --input_model densenet-201.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/googlenet/v1/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/googlenet/v1/caffe && 
	 python3 $MO_SCRIPT --input_proto googlenet-v1.prototxt --input_model googlenet-v1.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/googlenet/v2/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/googlenet/v2/caffe && 
	 python3 $MO_SCRIPT --input_proto googlenet-v2.prototxt --input_model googlenet-v2.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/googlenet/v4/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/googlenet/v4/caffe && 
	 python3 $MO_SCRIPT --input_proto googlenet-v4.prototxt --input_model googlenet-v4.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/inception-resnet/v2/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/inception-resnet/v2/caffe && 
	 python3 $MO_SCRIPT --input_proto inception-resnet-v2.prototxt --input_model inception-resnet-v2.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/resnet/v1/101/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/resnet/v1/101/caffe && 
	 python3 $MO_SCRIPT --input_proto resnet-101.prototxt --input_model resnet-101.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/resnet/v1/152/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/resnet/v1/152/caffe && 
	 python3 $MO_SCRIPT --input_proto resnet-152.prototxt --input_model resnet-152.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/resnet/v1/50/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/resnet/v1/50/caffe && 
	 python3 $MO_SCRIPT --input_proto resnet-50.prototxt --input_model resnet-50.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-inception/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-inception/caffe && 
	 python3 $MO_SCRIPT --input_proto se-inception.prototxt --input_model se-inception.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-resnet-101/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-resnet-101/caffe && 
	 python3 $MO_SCRIPT --input_proto se-resnet-101.prototxt --input_model se-resnet-101.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-resnet-152/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-resnet-152/caffe && 
	 python3 $MO_SCRIPT --input_proto se-resnet-152.prototxt --input_model se-resnet-152.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-resnet-50/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-resnet-50/caffe && 
	 python3 $MO_SCRIPT --input_proto se-resnet-50.prototxt --input_model se-resnet-50.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-resnext-101/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-resnext-101/caffe && 
	 python3 $MO_SCRIPT --input_proto se-resnext-101.prototxt --input_model se-resnext-101.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/se-networks/se-resnext-50/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/se-networks/se-resnext-50/caffe && 
	 python3 $MO_SCRIPT --input_proto se-resnext-50.prototxt --input_model se-resnext-50.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/squeezenet/1.0/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/squeezenet/1.0/caffe && 
	 python3 $MO_SCRIPT --input_proto squeezenet1.0.prototxt --input_model squeezenet1.0.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/squeezenet/1.1/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/squeezenet/1.1/caffe && 
	 python3 $MO_SCRIPT --input_proto squeezenet1.1.prototxt --input_model squeezenet1.1.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/vgg/16/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/vgg/16/caffe && 
	 python3 $MO_SCRIPT --input_proto vgg16.prototxt --input_model vgg16.caffemodel --output_dir $outdir

outdir=$OUTROOT/./classification/vgg/19/caffe && mkdir -p $outdir
cd /workspace/openvino-models/classification/vgg/19/caffe && 
	 python3 $MO_SCRIPT --input_proto vgg19.prototxt --input_model vgg19.caffemodel --output_dir $outdir

outdir=$OUTROOT/./face_recognition/sphereface/caffe && mkdir -p $outdir
cd /workspace/openvino-models/face_recognition/sphereface/caffe && 
	 python3 $MO_SCRIPT --input_proto Sphereface.prototxt --input_model Sphereface.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/mobilenet-ssd/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/mobilenet-ssd/caffe && 
	 python3 $MO_SCRIPT --input_proto mobilenet-ssd.prototxt --input_model mobilenet-ssd.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/mtcnn/o/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/mtcnn/o/caffe && 
	 python3 $MO_SCRIPT --input_proto mtcnn-o.prototxt --input_model mtcnn-o.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/mtcnn/p/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/mtcnn/p/caffe && 
	 python3 $MO_SCRIPT --input_proto mtcnn-p.prototxt --input_model mtcnn-p.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/mtcnn/r/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/mtcnn/r/caffe && 
	 python3 $MO_SCRIPT --input_proto mtcnn-r.prototxt --input_model mtcnn-r.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/ssd/300/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/ssd/300/caffe && 
	 python3 $MO_SCRIPT --input_proto ssd300.prototxt --input_model ssd300.caffemodel --output_dir $outdir

outdir=$OUTROOT/./object_detection/common/ssd/512/caffe && mkdir -p $outdir
cd /workspace/openvino-models/object_detection/common/ssd/512/caffe && 
	 python3 $MO_SCRIPT --input_proto ssd512.prototxt --input_model ssd512.caffemodel --output_dir $outdir

outdir=$OUTROOT/./semantic_segmentation/dilation/cityscapes/caffe && mkdir -p $outdir
cd /workspace/openvino-models/semantic_segmentation/dilation/cityscapes/caffe && 
	 python3 $MO_SCRIPT --input_proto dilation.prototxt --input_model dilation.caffemodel --output_dir $outdir
