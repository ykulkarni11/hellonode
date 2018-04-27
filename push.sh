docker rmi -f yogiraj11/storeweb:master || echo "master branch moving on"
docker tag "yogiraj11/storeweb:${BUILD_TAG}"yogiraj11/storeweb:master
docker push yogiraj11/storeweb:master
