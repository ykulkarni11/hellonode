pipeline {
 //   def app
    agent any

    stages {
        stage('Clone repository') {
          checkout scm
          }
    
        stage('Build image') {
               docker.build("yogiraj11/docker-hub-credentials")
            }
        
      }
}
