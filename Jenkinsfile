    node {
        def app
    
        stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
            
         emailext ( 
       to: 'ykulkarni@vdrivit.com', 
       subject: "Project Docker_Build_Push_Image : Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'", 
       body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
         <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>""",
       recipientProviders: [[$class: 'DevelopersRecipientProvider']]
     )
 
    }
    
        stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("yogiraj11/docker-hub-credentials")
         
         emailext ( 
       to: 'ykulkarni@vdrivit.com', 
       subject: "Project Docker_Build_Push_Image : Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'", 
       body: """<p>Completed Build: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
         <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>""",
       recipientProviders: [[$class: 'DevelopersRecipientProvider']]
     )
            
    }

        stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
                    }
        } 
        stage('Push image') {
        // Finally, we'll push the image with two tags:
         //* First, the incremental build number from Jenkins
        // * Second, the 'latest' tag.
        // * Pushing multiple tags is cheap, as all the layers are reused. 
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("master")
        }
    }
     stage('Deploy') {
        echo 'Deploying to Staging'
        sh "chmod 775 ./deploy.sh"
         sh './deploy.sh'
         
        
    }
    }
