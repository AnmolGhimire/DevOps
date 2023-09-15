
cd docker/docker-examples
echo "#################################"
whoami
echo "##################################"
docker image build -t docanmol/morning-devops:v$BUILD_NUMBER .
docker push docanmol/morning-devops:v$BUILD_NUMBER
docker container  run -itd --name myapp -p 8090:3000 docanmol/morning-devops:v$BUILD_NUMBER
docker container ps
