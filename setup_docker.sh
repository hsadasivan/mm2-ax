#install curl
sudo apt-get install curl;

#install docker
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker;
  
#install nvidia container toolkit
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list;
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list;
sudo apt-get update;
sudo apt-get install -y nvidia-docker2;
sudo systemctl restart docker;

sudo apt-get install -y build-essential;
sudo apt-get update;

sudo docker pull hariumich/mm2-ax:1.2;
sudo docker run -it --rm --gpus all --mount type=bind,source=${PWD},target=/mm2-ax/  hariumich/mm2-ax:1.2 bash;
