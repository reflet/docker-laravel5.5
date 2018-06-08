# Laravel5.5環境
ローカル環境の構築について記載します。

　
 
### ■ 前提条件
ローカル環境を以下gitで構築していること
* [GitHub - reflet/vagrant-centos7.5](https://github.com/reflet/vagrant-centos-7.5)
* [GitHub - reflet/server-laravel5.5](https://github.com/reflet/server-laravel5.5)

　

## ■ ファイルの配置
gitコマンドにてファイルを配置します。

```
$ cd /home/vagrant/opt/www/www.example.com/
$ rm -rf public
$ git clone https://github.com/reflet/app-laravel5.5.git .
```

　

## ■ Laravel環境の構築
### < 環境設定ファイルの作成 >
環境設定ファイルをコピーして作成する

```sh
$ cd /home/vagrant/opt/www/www.example.com/
$ cp .env.example .env
```

　

### < PHPの各ライブラリのインストール >
composerにてライブラリを管理しています

```ｓｈ
$ docker exec php bash -c "cd /var/www/www.example.com && composer install"
$ docker exec php bash -c "cd /var/www/www.example.com && php artisan key:generate"
```

　

### < JavaScriptの各ライブラリのインストール >
npmにてライブラリを管理しています

```ｓｈ
$ docker exec node bash -c "cd /var/www/www.example.com && npm install"
```

　

### データベースの作成
下記ファイルに記載のクエリなどを参考にDBを作成する。

```
/home/vagrant/opt/www/www.example.com/sql/example.sql
```

　

## 環境設定
Laravelの.envファイルを修正します。

※ File: ./www/www.example.com/.env

```
APP_URL=http://www.example.com

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=example
DB_USERNAME=hoge
DB_PASSWORD=development
```

　

### passport
認証関連でpassportをインストールする場合は、以下の作業を行う。
参考サイト：https://qiita.com/niiyz/items/fffff94acb6061ecc9d4

```sh
# UsersテーブルのSeeder作成 & 調整
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && php artisan make:seeder UsersTableSeeder"
$ vi database/seeds/UsersTableSeeder.php
$ vi database/seeds/DatabaseSeeder.php

# 認証処理を作成する
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && php artisan make:auth"

# passportをインストールする
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && composer require laravel/passport"

# DBのマイグレーション実行
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && php artisan migrate"

# Seederを実行
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && php artisan db:seed"

# OAuth Clientを作成
$ docker exec -it php bash -c "cd /var/www/www.example.com/ && php artisan passport:client"
```

## ■ 動作確認
以下URLへアクセスし、ページが開くことを確認 ( ※hosts設定: 192.168.33.20    www.example.com )

- https://www.example.com

　
