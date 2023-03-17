# セットアップ手順

# アドレスを設定

赤色の部分を入力

![1](img1.png "これがアドレスの設定")
![2](img2.png "これがアドレスの設定")
アドレスは10.226.47.GPU番号+10
![3](img3.png "これがアドレスの設定")

Gitを入れて、このリポジトリをクローンし、セットアップを実行
```
sudo apt update
sudo apt install git -y
git clone http://10.226.47.83:8080/jikuya/gpu-setup-20.04
cd gpu-setup-20.04
sudo bash setup.sh
```
出てくる選択肢に y を打つ
sshdのサービスを再起動，マウント，FSアドレス書き込み，マウント実行，シンボリックリンク作成

自動的に再起動（されないかも）

# prometheusインストール
```
sudo bash prometheus.sh
```

sshとnvidia-smiとsudo docker psができるかを確認

## この後は各自dockerを作るだけ
20.04のDocker fileのサンプル：
[jikuya_docker_setup_20.04](http://10.226.47.83:8080/jikuya/jikuya_docker_20.04_11.6)