#sshのインストール
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install ssh

# sudo nano /etc/ssh/sshd_config
# "#PermitRootLogin prohibit-password" を "PermitRootLogin no"　に書き換え
