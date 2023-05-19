sudo apt update -y
sudo apt upgrade -y
sudo apt install tmux vim

#sshのインストール
sudo bash ssh.sh

# マウント
sudo bash mount.sh

# Dockerインストール
sudo bash docker.sh

# NVIDIAドライバ インストール
sudo bash driver.sh

sudo reboot