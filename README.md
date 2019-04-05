# OpenVINO in Ubuntu Docker
*Apr'19*

> This repo is stil under development

This repo aims to provide step-by-step setup of OpenVINO in Ubuntu:16.04 docker environment. OpenVINO provides many examples but the documentation, IMHO, provides scattered steps and many branching due to support of many compute devices. This repo targets only *CPU with Integrated Graphics* and the USB Neural Compute Stick. We hope to capture the steps in a single readme and in a linear fashion, i.e. set up OpenVINO, configure Model Optimizer, download models in various framework and run some of out-of-the-box samples with Inference Engine.

## Tested System
* Skylake Core i7-6770HQ, Iris Pro Graphics 580 (Skull Canyon NUC)
* Kabylake Core i7-7500U, HD Graphics 620
* Neural Compute Stick
> Your contribution to this list is very much appreciated! Please add your processor if you have successfully complete the whole process on your system.

## Setup
The approach we are taking here is a hybrid of interactive docker build and the "Dockerfile" way due to the challenge of storing large prebuilt binary installation archive in git. *Yes, I am avoiding git-lfs.* On a side note, you could try to build OpenVINO from [source](https://github.com/opencv/dldt).

1. [Set up Docker CE on host](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

2. Download the [OpenVINO installation archive for linux](https://software.intel.com/en-us/openvino-toolkit/choose-download/free-download-linux) and [OpenCL Drivers and Runtime](https://github.com/intel/compute-runtime/releases)
    ```bash
    # OpenVINO R5.0.1 for linux
    mkdir ~/openvino-setup && cd ~/openvino-setup
    mv ~/Downloads/l_openvino_toolkit_p_2018.5.455.tgz .
    tar -zxf l_openvino_toolkit_p_2018.5.455.tgz

    # OpenCL Release 19.01.12103
    mkdir -p ~/openvino-setup/neo && cd ~/openvino-setup/neo
    wget https://github.com/intel/compute-runtime/releases/download/19.01.12103/intel-gmmlib_18.4.0.348_amd64.deb
    wget https://github.com/intel/compute-runtime/releases/download/19.01.12103/intel-igc-core_18.50.1270_amd64.deb
    wget https://github.com/intel/compute-runtime/releases/download/19.01.12103/intel-igc-opencl_18.50.1270_amd64.deb
    wget https://github.com/intel/compute-runtime/releases/download/19.01.12103/intel-opencl_19.01.12103_amd64.deb
    ```
3. In order to use the integrated graphics, graphics drivers, libVA and dependencies are required. We will build a docker base image that has these dependencies installed. This step is run on host.
    ```bash
    cd ~
    git clone https://github.com/vuiseng9/openvino-ubuntu
    cd openvino-ubuntu/docker
    ./build_media_docker.sh
    ```
4. Instantiate the built ```ubuntu-media``` container
    ```bash
    container=ubuntu-media

    sudo xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $container`

    sudo docker run \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /home/${USER}:/hosthome \
        -v /home/${USER}/openvino-setup:/workspace/openvino-setup \
        -v /home/${USER}/openvino-ubuntu:/workspace/openvino-ubuntu \
        --device=/dev/dri:/dev/dri \
        --privileged \
        -w /workspace \
        -it ${container} bash
    ```
5. Install dependencies
    ```bash
    apt-get update && \
    apt-get install -y \
        autoconf git curl vim libdrm-dev libgl1-mesa-glx libgl1-mesa-dev sudo pciutils \
        libx11-dev openbox unzip xorg xorg-dev cpio python3 lsb-core yasm clinfo eog
    ```
6. Install OpenVINO dependent packages
    ```bash
    cd /workspace/openvino-setup/l_openvino_toolkit_p_2018.5.455
    ./install_cv_sdk_dependencies.sh
    ```
7. Install OpenCL Drivers & Runtime
    ```bash
    cd /workspace/openvino-setup/neo
    dpkg -i *.deb

    # By now, you should expect to see a list of devices that include iGPU by running "clinfo"
    ```
8. Install OpenVINO
    ```bash
    cd /workspace/openvino-setup/l_openvino_toolkit_p_2018.5.455
    ./install.sh
    ```
9. Add OpenVINO environment setup script in .bashrc so that it gets sourced whenever container is instantiated
    ```bash
    echo "source /opt/intel/computer_vision_sdk/bin/setupvars.sh" >> ~/.bashrc
    source ~/.bashrc
    ```
10. Set up Model Optimizer
    ```bash
    cd /opt/intel/computer_vision_sdk/deployment_tools/model_optimizer/install_prerequisites
    ./install_prerequisites.sh
    ```
11. Validate OpenVINO setup, you should expect demo run successfully
    ```bash
    cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
    ./demo_squeezenet_download_convert_run.sh
    ```

## Model Optimizer
This section configures Model Optimizer for DL frameworks and provides steps to translate to OpenVINO intermediate representation (IR) format. We only focus Caffe and Tensorflow at the moment.

1. Download sample models, the default installation comes with a python script to download popular topologies but mostly Caffe models. We provides scripts to download Tensorflow models. Do note that we store the models on the host as they are large in size (tens of GB in total).
   ```bash
   cd /workspace && mkdir -p /hosthome/nn_models && ln -sv /hosthome/nn_models .
   # Run OpenVINO downloader
   $INTEL_CVSDK_DIR/deployment_tools/model_downloader/downloader.py --all -o /hosthome/nn_models

   # Download Frozen Tensorflow Models (object detection and quantized)
   cd /workspace/openvino-ubuntu/scripts/
   ./dl-tf-obj-det-frozen-mdl.sh
   ./dl-tf-quant-frozen-mdl.sh
   ```
2. Some of the downloaded models are already in IR format. We will convert the rest of them to IR. 
   ```bash
   cd /workspace/openvino-ubuntu
   ./scripts/run_mo_caffe.sh 2>&1 | tee log.run_mo_caffe
   ```
## References
1. [OpenVINO Latest Documentation](https://docs.openvinotoolkit.org/)
