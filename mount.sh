# マウント
sudo apt-get install -y nfs-common

sudo mkdir -p /mnt/gpu-node
sudo echo "10.226.47.91:/home /mnt/gpu-node nfs rw 0 0" >> /etc/fstab
sudo mkdir /mnt/qnap2
sudo echo "10.226.47.81:/homes /mnt/qnap2 nfs rw 0 0" >> /etc/fstab
sudo mount -a
sudo ln -s /mnt/qnap2/* /home/