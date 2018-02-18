# build
cd ./jumphost
docker build -t jumphost ./

cd ../web
docker build -t web ./

cd ../db
docker build -t db ./

