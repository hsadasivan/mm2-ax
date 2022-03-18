# mm2-ax
 
mm2-ax is [minimap2 v2.18](https://github.com/lh3/minimap2/tree/7bc87b4175dcf3b6df7d4f6ae9db5f3eadd30302) with GPU accelerated chaining for accurate long read alignment.

**If you are using/comparing to this work as part of your research/project, please cite: Sadasivan, Harisankar, Milos Maric, Eric Dawson, Vishanth Iyer, Johnny Israeli, and Satish Narayanasamy. "[Accelerating Minimap2 for accurate long read alignment on GPUs.](https://www.biorxiv.org/content/10.1101/2022.03.09.483575v1.full.pdf)" bioRxiv (2022).**
Please direct all queries to [Harisankar Sadasivan](https://github.com/harisankarsadasivan?tab=repositories), hariss@umich.edu


**1. Pre-requisites for testing**:

**1.1 Hardware**:

x86-64 CPU with 85GB RAM and A100 GPU with 40GB DRAM. OS:  Ubuntu 18.04
Suggested GCP instance with this configuration: a2-highgpu-1g
Suggested minimum data disk size: 500GB
Support for other environments is not tested.

**1.2 Software**:

(1) Pull [docker image](https://hub.docker.com/repository/docker/hariumich/mm2-ax/general)
```
git clone https://github.com/hsadasivan/mm2-ax.git
cd mm2-ax/;
sudo chmod +x *.sh
./setup_docker.sh;

```

(2) Download datasets and run mm2-ax:

```
cd mm2-ax;
./get_datasets.sh
./mm2-ax.sh <desired_read_length>
```
>Please choose desired_read_length from any of {2000,3000,4000,5000,10000,20000,30000,40000,50000,100000,150000}

(3) Output validation: After ./mm2-ax.sh completes, you may please compare mm2-ax generated out/*.log with [mm2-fast v2.18](https://github.com/lh3/minimap2/tree/d6e6811a0f797e2a8391b02497b99739e7a14c31) generated out/*-mm2-fast.log to validate the output.


**2. Current limitations**:

(1) Current support is only for 1 CPU thread.

(2) Please use only the input datasets and application provided for testing. Development of concurent GPU I/O management is in-progress and future releases will support any input number of reads.

(3)Please do not compare the wall-clock time as the application is not yet optimized for end-to-end time. We optimize only for chaining and print the measured time in the log.
