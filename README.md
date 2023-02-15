## -1- Run mysql container :
docker run --rm -d --name mysql \
    -e MYSQL_ROOT_PASSWORD="petclinic" \
    -e MYSQL_DATABASE="petclinic" \
    -e MYSQL_USER="petclinic" \
    -e MYSQL_PASSWORD="petclinic" \
    -v /data/atk-projet-demo/mysql:/var/lib/mysql \
    -p 3306:3306 mysql:latest
## -2- paacage the project 
.\mvn package  // OR in windows os use this command : .\mvncmd package 
## -3-  Build docker image
docker build -t  petclinic .

## -4-  run container petclinic from new image:
docker run --rm -it -d --name petclinic    --link mysql:mysql  -p 9090:8080  petclinic

