# build
cd ../web
docker build -t web ./

cd ../db
docker build -t db ./

cd ../batch
docker build -t batch ./

