# OpenVINO in Ubuntu Docker
*April'19, vuiseng9*

This repo aims to provide step-by-step setup of OpenVINO in Ubuntu docker environment on Intel CPU that also features integrated graphics. Steps will cover configuration and samples of Model Optimizer and Inference Engine.

## Tested System
* Skylake Core i7-6770HQ (Skull Canyon NUC)
* Kabylake Core i7-7500U 

> Your contribution to this list is very much appreciated! Please add your processor if you have successfully complete the whole process on your system

## Setup
The approach we are taking here is an interactive docker build instead of the "Dockerfile" way due to the challenge of large prebuilt binary installation archive in git. *Yes, I am avoiding git-lfs* unless you would like to build OpenVINO from [source](https://github.com/opencv/dldt).

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
        --device=/dev/dri:/dev/dri \
        --privileged \
        -w /workspace \
        -it ${container} bash
    ```
5. Install dependent packages
    ```bash
    apt-get update && \
    apt-get install -y \
        autoconf git curl vim libdrm-dev libgl1-mesa-glx libgl1-mesa-dev sudo pciutils \
        libx11-dev openbox unzip xorg xorg-dev cpio python3 lsb-core yasm clinfo
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
