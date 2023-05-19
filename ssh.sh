#sshのインストール
sudo apt install -y ssh

# PermitRootLogin 書き換え
sudo sed -i '/PermitRootLogin prohibit-password/c PermitRootLogin no' /etc/ssh/sshd_config

# ssh リスタート
sudo /etc/init.d/ssh restart