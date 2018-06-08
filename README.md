# Laravel5.5環境
Laravelの動く環境を作ってみる。

## 前提条件
- PHP7.2の環境です
- dockerクライアントが必要
- docker-composeが必要
- hostのフォルダをマウントする場合は、dockerの実行ユーザーは、UID:GID = 1000:1000 のユーザーにしてください。

## vagrant
下記vagrant環境で実行する場合は、下記コマンドにてdockerユーザーを作成して利用ください。
* [Vagrant (CentOS7.3)](https://github.com/QLife-Inc/vagrant-centos73)

```
$ sudo useradd docker -g docker
$ sudo su - docker
$ mkdir ~/opt
$ cd ~/opt
$ git clone https://github.com/reflet/server-laravel5.5.git .
$ docker-compose up -d --build
```

以上
