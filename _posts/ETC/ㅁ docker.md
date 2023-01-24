brew install colima
brew install --cask docker

docker context ls
docker context use desktop-linux
docker context use colima

colima start --memory 4 --arch x86_64
docker run -e ORACLE_PASSWORD=pass -p 1521:1521 -d gvenzl/oracle-xe
docker logs -f 컨테이너명
docker ps -a
docker start f4ac517e4ee4

docker run --name oracle -e ORACLE_PASSWORD=pass -p 1521:1521 -d gvenzl/oracle-xe
docker run --restart unless-stopped --name oracle -e ORACLE_PASSWORD=pass -p 1521:1521 -d gvenzl/oracle-xe