# Laravel5.5環境
Laravelの動く環境を作ってみる。

## 前提条件
- dockerクライアントが必要
- docker-composeが必要

下記vagrant環境で実行する場合は、上記条件を満たしています。
* [Docker Toolbox on macOS](https://docs.docker.com/toolbox/toolbox_install_mac/)

## コードの配置
必要となるコードをリポジトリからcloneして配置します。

```
$ mkdir ~/laravel5.5 && cd ~/laravel5.5
$ git clone https://github.com/reflet/docker-laravel5.5.git .
```

## コンテナの構築
```
$ docker-compose build
```

## コンテナの起動
```
$ docker-compose up -d
```
※ hosts設定で「192.168.99.100 www.example.com」を追加する

※ ブラウザで「http://www.exeample.com」にアクセスしてみる

## コンテナの状態確認
```
$ docker-compose ps
```

## コンテナの停止
```
$ docker-compose stop
```

## コンテナの破棄
```
$ docker-compose down -v
```

## Laravelについて
DB構成が変わった時には、migrationを実行する。

```
$ docker-compose exec php php artisan migrate
```
