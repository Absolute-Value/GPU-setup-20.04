#sshのインストール
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y ssh
# PermitRootLogin 書き換え
sudo sed -i '/PermitRootLogin prohibit-password/c PermitRootLogin no' /etc/ssh/sshd_config

# ssh リスタート
sudo /etc/init.d/ssh restart

# マウント
sudo apt-get install -y nfs-common

sudo mkdir -p /mnt/gpu-node
sudo echo "10.226.47.91:/home /mnt/gpu-node nfs rw 0 0" >> /etc/fstab
sudo mkdir /mnt/qnap2
sudo echo "10.226.47.81:/homes /mnt/qnap2 nfs rw 0 0" >> /etc/fstab
sudo mount -a
sudo ln -s /mnt/qnap2/* /home/

# ドッカーインストール
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common # 下準備
# dockerのレポジトリを追加して使えるように
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io # Dockerをインストール

# Docker-compose
sudo -i
sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
exit
sudo apt install python3-pip
sudo pip install -y -U docker-compose
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# NVIDIAドライバ インストール (https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
