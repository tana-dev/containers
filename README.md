# Docker Command
## centos7を持ってきてrun
### pull
```
local> docker pull centos:7
```

### run
```
local> docker run -it centos:7 bash
```

## イメージ確認
### イメージ一覧
```
local> docker images
```

## コンテナ確認
### 実行中のコンテナのみ表示する
```
local> docker ps
```

### 停止中のコンテナも含めて表示する
```
local> docker ps -a
```

## ネットワーク確認
### ネットワーク一覧
```
local> docker network ls
```

### ネットワーク情報閲覧
```
local> docker network inspect <NETWORK NAME>
```

## 削除
### コンテナ削除
```
local> docker rm --force <CONTAINER ID>
```

### イメージ削除
```
local> docker rmi <IMAGE ID>
```

### 動いているコンテナ以外全て消す
```
local> docker rm $(docker ps -a -q)
```

### 停止中の全コンテナを一括で削除
```
local> docker rm $(docker ps -aq)
```

## buildしてrun
### build
```
local> docker build -t <CONTAINER NAME> ./
```

### run
```
local> docker run --rm -it <CONTAINER NAME> bash
```

## buildしてコンテナ立ち上げてexec
### build
```
local> docker build -t <CONTAINER NAME> ./
```

### 特権モードでコンテナ起動
```
local> docker run -it --rm --privileged -d <CONTAINER NAME> /sbin/init
```

### exec
```
local> docker exec -it <CONTAINER ID> bash
```

## その他サンプル
```
local> docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -d -p 3306:3306 mysql:5.6
local> docker run --name apache -d -p 8080:80 php:5.3-apache
local> docker exec -ti apache bash
local> docker network create --subnet=192.168.56.0/24 user_network
local> docker run -it --name test --net=user_network --ip=192.168.56.100 -d centos bash
```

