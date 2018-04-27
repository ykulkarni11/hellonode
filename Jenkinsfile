node {
  def app
  // Mark the code checkout 'stage'....
  stage 'Stage Checkout'

  // Checkout code from repository and update any submodules
  checkout scm
  sh 'git submodule update --init'  

  stage 'Stage Build'

  //branch name from Jenkins environment variables
  app=docker.build("yogiraj11/docker-hub-credentials")
  
  stage 'Test Build'
  app.inside {
            sh 'echo "Tests passed"'
        }
  
  stage 'Build Push'{
  docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("master")
        }
  } 
  stage 'Build Deploy'{
     docker pull yogiraj11/storeweb:master
     docker stack deploy --compose-file docker-compose.yml StoreWebStack
  }
  
  
/*
  stage 'Stage Archive'
  //tell Jenkins to archive the apks
  archiveArtifacts artifacts: 'app/build/outputs/apk/*.apk', fingerprint: true

  stage 'Stage Upload To Fabric'
  sh "./gradlew crashlyticsUploadDistribution${flavor}Debug  -PBUILD_NUMBER=${env.BUILD_NUMBER}"*/
}
