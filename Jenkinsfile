pipeline {
    def app
    agent any

    stages {
        stage('Clone repository') {
          checkout scm
          }
    
        stage('Build image') {
                app = docker.build("yogiraj11/docker-hub-credentials")
            }
        
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
