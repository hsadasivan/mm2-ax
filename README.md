# mm2-ax
 
mm2-ax is [minimap2 v2.17](https://github.com/lh3/minimap2/tree/7bc87b4175dcf3b6df7d4f6ae9db5f3eadd30302) with GPU accelerated chaining for accurate long read alignment.

If you are using mm2-ax in any part of your work, please cite:
>Harisankar Sadasivan, Milos Maric, Eric Dawson, Vishanth Iyer, Johnny Israeli, Satish Narayanasamy. Accelerating Minimap2 for Accurate Long Read Alignment on GPUs. Journal of Biotechnology and Biomedicine 6 (2023): 13-23.


![overview](https://user-images.githubusercontent.com/84148853/159078375-9ec1b75a-72cd-4e51-be34-4877e8144ef4.png)





**1. Hardware recommendations**:

x86-64 CPU with 85GB RAM and A100 GPU with 40GB DRAM. 
OS:  Ubuntu 18.04
Suggested GCP instance with this configuration: a2-highgpu-1g
Suggested minimum data disk size: 500GB.
Pro-tip: Researchers may use the first time free credits $300-400 from GCP.
Please note that support for other environments is not tested.

**2. Software**:

**(2.1) Docker/Singularity set-up:**

Docker:
Unfortunately, mm2-ax is currently closed source from NVIDIA but we provide a [docker container](https://hub.docker.com/repository/docker/hariumich/mm2-ax) to easily test mm2-ax. 

```
git clone https://github.com/hsadasivan/mm2-ax.git
cd mm2-ax/;
sudo chmod +x *.sh
./setup_docker.sh;
```

Follow this for singularity:
Although docker is the most popular container environment, we realize that some of our users may use bare-metal GPUs and therefore we suggest the following to use singularity to load the docker image. Please follow [singularity installation manual](https://docs.sylabs.io/guides/3.0/user-guide/quick_start.html#:~:text=Singularity%20v3.,image%20format%20that%20is%20writable.). Make sure to install singularity version 3.5.3.


```
singularity pull docker://hariumich/mm2-ax:1.2
singularity shell --nv mm2-ax_1.2.sif
```

**(2.2) Download dataset and/or bin reads:**
```
git clone https://github.com/hsadasivan/mm2-ax.git; cd mm2-ax/;
./get_datasets.sh <path_to_custom_dataset> <1 to use downloaded dataset; 0 to use custom>
#For example, if you are downloading 60X HG002 dataset from paper please use the following:
# ./get_datasets.sh data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fasta 1
```

**(2.3) Running mm2-ax on downloaded HG002 60X:**
```
./mm2-ax.sh <desired_read_length> <path_to_ONT_folder>
#for example, ./mm2-ax.sh 2000 data/ONT
```
>Please choose desired_read_length from any of {2000, 3000, 4000, 5000, 10000, 20000, 30000, 40000, 50000, 100000, 150000}

**(2.3) Alternatively, run mm2-ax on a binned custom ONT dataset from 2.2:**
```
bin/mm2-ax -t 1 -x map-ont <path_to_mm2_index.mmi> <FASTA/FASTQ input> --total-no-of-reads=<total reads in input file> --blocks-per-stream=<reads per stream> > mm2-ax-<read-length>.log
#<reads per stream> may be used for tuning the performance on your GPU of choice (Pascal,Volta, Turing and Ampere).
#For compute capabilities of 7.0, 7.2 and 8.0, we recommend,
#blocks-per-stream=9 (for > 10Kb) or 972 (for <=10Kb) based on the read lengths of choice.

```

**3. Output validation:**

After step (2) is complete, you may please compare mm2-ax generated output to [minimap2](https://github.com/lh3/minimap2/tree/7bc87b4175dcf3b6df7d4f6ae9db5f3eadd30302) or [mm2-fast](https://github.com/lh3/minimap2/tree/d6e6811a0f797e2a8391b02497b99739e7a14c31)
```
bin/minimap2 -t 1 -x map-ont <.mmi index> <FASTA/FASTQ input> > minimap2-<read-length>.log
bin/mm2-fast -t 1 -x map-ont <.mmi index> <FASTA/FASTQ input> > mm2-fast-<read-length>.log
gvim -d mm2-ax-<read-length>.log minimap2-<read-length>.log
```


**Limitations**:

(1) Currently, we only support one host CPU thread.

(2)Please do not compare the wall-clock time as the application is not yet optimized for end-to-end time. We optimize only for chaining (including data transfer costs) and print the measured time in stderr.

(3) If you are using a custom large dataset and the program fails with Invalid GPU address or out of GPU memory error, please reduce the number of input reads and re-try. mm2-ax is curretly limited by the GPU's DRAM capacity. Please refer to mm2-ax.sh for approximate numbers per read length for a 40GB DRAM.




