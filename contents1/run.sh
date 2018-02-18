# network create
docker network create --subnet=192.168.56.0/24 my_net

# jumphost
docker run -it --rm --privileged -d --net my_net -p 2201:22 --ip 192.168.56.100 -h jumphost --name jumphost jumphost /sbin/init

# web
docker run -it --rm --privileged -d --net my_net -p 2202:22 -p 8880:80 --ip 192.168.56.101 -h web --name web web /sbin/init

# db
docker run -it --rm --privileged -d --net my_net -p 2203:22 -p 3306:3306 --ip 192.168.56.102 -h db --name db db /sbin/init

