# network create
docker network create --subnet=192.168.56.0/24 my_net

# web
docker run -dit -p 8080:80 --ip 192.168.56.100 -h web --name web web /usr/sbin/httpd

# db
docker run -dit -p 3306:3306 --ip 192.168.56.101 -e MYSQL_ROOT_PASSWORD=mysql -h test-docker-db --name db db

# db
docker run -dit --ip 192.168.56.102 -h test-docker-batch --name batch batch

