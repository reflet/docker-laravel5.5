# Laravel5.5環境
Laravelの動く環境を作ってみる。

## 前提条件
- dockerクライアントが必要
- docker-composeが必要

下記vagrant環境で実行する場合は、上記条件を満たしています。
* [Vagrant (CentOS7.3)](https://github.com/reflet/vagrant-centos-7.3.git)

## コードの配置
必要となるコードをリポジトリからcloneして配置します。

```
$ cd /home/vagrant/opt
$ git clone https://github.com/reflet/server-laravel5.5.git .
```

## コンテナの構築
```
$ cd /home/vagrant/opt
$ docker-compose build --no-cache
```

## コンテナの起動
```
$ cd /home/vagrant/opt
$ docker-compose up -d
```

## コンテナの状態確認
```
$ cd /home/vagrant/opt
$ docker-compose ps
```

## コンテナの停止
```
$ cd /home/vagrant/opt
$ docker-compose stop
```

## コンテナの破棄
```
# コンテナ破棄
$ cd /home/vagrant/opt
$ docker-compose down

# コンテナ破棄 (ボリュームも含めて削除) 
# ※ DBデータも初期化されるので注意！！
$ cd /home/vagrant/opt
$ docker-compose down
```

## Laravelについて
DB構成が変わった時には、下記コマンドにてmigrationを実行する。

```
$ docker exec php bash -c "cd /var/www/www.example.com && php artisan migrate" 
```
