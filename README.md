# Docker install
### mac
#### docker for mac のインストール
https://docs.docker.com/docker-for-mac/install/

#### docker-compose のインストール
https://github.com/docker/compose/releases

### windows
#### docker for windows のインストール
https://docs.docker.com/docker-for-windows/
https://qiita.com/chr/items/184b6af37d105bdad145

# Docker Command
### centos7を持ってきてrun
#### pull
```
local> docker pull centos:7
```

#### run
```
local> docker run -it centos:7 bash
```

### イメージ操作
#### イメージ一覧
```
local> docker images
```
#### イメージ削除
```
local> docker rmi <IMAGE ID>
```

### コンテナ操作
#### 実行中のコンテナのみ表示する
```
local> docker ps
```

#### 停止中のコンテナも含めて表示する
```
local> docker ps -a
```

#### コンテナ削除
```
local> docker rm --force <CONTAINER ID>
```

#### 動いているコンテナ以外全て消す
```
local> docker rm $(docker ps -a -q)
```

#### 停止中の全コンテナを一括で削除
```
local> docker rm $(docker ps -aq)
```

### ネットワーク操作
#### ネットワーク一覧
```
local> docker network ls
```

#### ネットワーク情報閲覧
```
local> docker network inspect <NETWORK NAME>
```

#### ネットワーク作成
```
local> docker network create <NETWORK NAME>
local> docker network create --subnet=192.168.56.0/24 <NETWORK NAME>
```

#### ネットワーク削除
```
local> docker network rm <NETWORK NAME>
```


### buildしてrun
#### build
```
local> docker build -t <CONTAINER NAME> ./
```

#### run
```
local> docker run --rm -it <CONTAINER NAME> bash
docker run --privileged \ #特権。SElinuxが有効なときに必要。
           -h httpd2 \    #ホスト名
           -d \           #デタッチした状態
           -p 8080:80 \   #ポートの指定、ホスト側:コンテナ側
           --name [new-container-name] \ #新しく作るコンテナ名
           [new-image-name] \ #コンテナの元にするイメージ
            /sbin/init \  #コンテナで起動するプログラム
```

### buildしてコンテナ立ち上げてexec
#### build
```
local> docker build -t <CONTAINER NAME> ./
```

#### 特権モードでコンテナ起動
```
local> docker run -it --rm --privileged -d <CONTAINER NAME> /sbin/init
local> docker run -it --rm --privileged -d --net my_net -p 8880:80 -h web --name "web" <CONTAINER NAME> /sbin/init
local> docker run -it --rm --privileged -d --net my_net --ip=192.168.56.100 -h web --name "web" <CONTAINER NAME> /sbin/init
```

#### exec
```
local> docker exec -it <CONTAINER ID> bash
```

### その他
#### runオプション
|オプション|説明|例|
|:--|:--|:--|
|-it|コンソールに結果を出力|docker run -it --name "test" centos /bin/cal|
|--rm|コンテナをexitした時に自動的にコンテナを削除|docker run -it --name "test" centos /bin/cal|
|--name|コンテナ名を指定|docker run --name "test" centos|
|-net|使用するネットワークを指定する\n noneの場合ネットワークが割り当てられない。\n hostを使用する場合ホストのIPを使用する。→でも外部からはコンテナにつながらない||
|-d|バッググラウンド実行|docker run -d centos|
|-p host:cont|ポートフォワーディング|docker run -d -p 8080:80 httpd|
|--add-host|ホスト名とIPを指定|docker run -it --add-host=test.com:192.168.1.1 centos|
|--dns|DNSサーバを指定|docker run --dns=192.168.1.1 httpd|
|--mac-address|MACアドレスを指定|docker run -it --mac-address="92:d0..." centos|
|--cpu-shares|CPU配分 (全体で1024)|docker run --cpu-shares=512 centos|
|--memory|メモリの上限|docker run --memory=512m centos|
|-v|ディレクトリの共有|docker run -v /c/Users/src:/var/www/html httpd|
|-e|環境変数を設定|docker run -it -e foo=bar centos /bin/bash|
|--env-file|環境変数リストから設定|docker run -it --env-file=env_list centos /bin/bash|
|-w|作業ディレクトリを指定|docker run -it -w=/tmp/work centos /bin/bash|

#### 参考サイト
##### runオプション
* https://qiita.com/wMETAw/items/34ba5c980e2a38e548db
* https://qiita.com/umchifre/items/31d9533049c591569279
##### docker概念
* https://morizyun.github.io/docker/about-docker-command.html
##### docker compose
* https://qiita.com/y_hokkey/items/d51e69c6ff4015e85fce

### サンプル
```
local> docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -d -p 3306:3306 mysql:5.6
local> docker run --name apache -d -p 8080:80 php:5.3-apache
local> docker exec -ti apache bash
local> docker network create --subnet=192.168.56.0/24 user_network
local> docker run -it --name test --net=user_network --ip=192.168.56.100 -d centos bash
```


# Docker Compose
### YAMLに「build:」があれば、そのイメージをまとめてビルド
```
docker-compose build
```

### YAMLに「image:」があれば、そのイメージをまとめてプル
```
docker-compose pull
```

### docker-compose build, docker-compose pullをした後にdocker run
```
docker-compose up -d
```

### 個別のサービスを指定することもできる。依存関係がある場合は関係するコンテナすべてが起動するので、この場合は redmine と mysql が両方起動する
```
docker-compose up -d redmine
```

### 関係するコンテナすべての出力を表示
```
docker-compose logs
```

### 関係するコンテナをまとめて終了
```
docker-compose stop
```

### 関係するコンテナをまとめて削除
```
docker-compose rm
```

#### 参考サイト
* https://qiita.com/aild_arch_bfmv/items/d47caf37b79e855af95f
* https://qiita.com/prgseek/items/e557a371d7bd1f57b9b1
* https://knowledge.sakura.ad.jp/5736/



# selenium
#https://www.kaitoy.xyz/2017/07/12/2017-selenium-headless-browsers/
#http://vividcode.hatenablog.com/entry/web-driver-introduction-2017
