docker rmi -f yogiraj11/storeweb:develop || echo "Develop branch moving on"
docker tag "yogiraj11/storeweb:${BUILD_TAG}"yogiraj11/storeweb:develop
docker push yogiraj11/storeweb:develop
