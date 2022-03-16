# mm2-ax
**Pre-requisites for testing**:

Hardware:

x86 CPU with 85GB RAM and A100 GPU with 40GB DRAM.
Suggested GCP instance with this configuration: a2-highgpu-1g
Suggested minimum data disk size: 500GB

Software:


(1) Please install the latest NVIDIA CUDA Toolkit and driver from https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=runfile_local

Tips: Please don't forget to edit system PATH and libpath for the toolkit and then to re-start the machine. Use nvcc --version to see if toolkit is installed and nvidia-smi to see GPU driver is detected. Proceed if these two checks pass. 


(2) Run ./run.sh provided for Ubuntu 18.04 system. Kindly modify accordingly for other environments.
