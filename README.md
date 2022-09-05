# mm2-ax
 
mm2-ax is [minimap2 v2.17](https://github.com/lh3/minimap2/tree/7bc87b4175dcf3b6df7d4f6ae9db5f3eadd30302) with GPU accelerated chaining for accurate long read alignment.



![overview](https://user-images.githubusercontent.com/84148853/159078375-9ec1b75a-72cd-4e51-be34-4877e8144ef4.png)



**If you are using/comparing to this work as part of your research/project, please cite: Sadasivan, Harisankar, Milos Maric, Eric Dawson, Vishanth Iyer, Johnny Israeli, and Satish Narayanasamy. "[Accelerating Minimap2 for accurate long read alignment on GPUs.](https://www.biorxiv.org/content/10.1101/2022.03.09.483575v1.full.pdf)" bioRxiv (2022).**
Please direct all queries to [Harisankar Sadasivan](https://github.com/harisankarsadasivan?tab=repositories), hariss@umich.edu


**1. Pre-requisites for testing**:

**1.1 Hardware**:

x86-64 CPU with 85GB RAM and A100 GPU with 40GB DRAM. OS:  Ubuntu 18.04
Suggested GCP instance with this configuration: a2-highgpu-1g
Suggested minimum data disk size: 500GB
Support for other environments is not tested.

**1.2 Software**:

(1) Run 

Follow this for docker:
mm2-ax is closed source but we provide a [docker container](https://hub.docker.com/repository/docker/hariumich/mm2-ax) to easily test mm2-ax. 
```
git clone https://github.com/hsadasivan/mm2-ax.git
cd mm2-ax/;
sudo chmod +x *.sh
./setup_docker.sh;
cd mm2-ax;
./mm2-ax.sh <desired_read_length> <path_to_data_folder>
#For correctness check use bin/minimap2-correcteness-check
```

Follow this for singularity:
Although docker is the most popular container environment, we realize that some of our users may use bare-metal GPUs and therefore we would like to provide help with using singularity to load the docker image. Please follow [singularity installation manual](https://docs.sylabs.io/guides/3.0/user-guide/quick_start.html#:~:text=Singularity%20v3.,image%20format%20that%20is%20writable.). Make sure to install singularity version 3.5.3.


```
singularity pull docker://hariumich/mm2-ax:1.2
singularity shell mm2-ax_1.2.sif
```
>Please choose desired_read_length from any of {2000, 3000, 4000, 5000, 10000, 20000, 30000, 40000, 50000, 100000, 150000}

(3) Output validation: After ./mm2-ax.sh completes, you may please compare mm2-ax generated output in out/*.log with [mm2-fast v2.18](https://github.com/lh3/minimap2/tree/d6e6811a0f797e2a8391b02497b99739e7a14c31) to mm2-fast generated output out/*-mm2-fast.log.


**2. Current limitations**:

(1) Current support is only for 1 CPU thread.

(2) Please use only the input datasets and application provided for testing. Development of concurent GPU I/O management is in-progress and future releases will support any input number of reads. If mm2-ax fails on any of the bins, please clear your GPU's DRAM or use another GCP instance.

(3)Please do not compare the wall-clock time as the application is not yet optimized for end-to-end time. We optimize only for chaining and print the measured time in the log.


