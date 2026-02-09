pipeline {
    agent any
    
    stages {
        stage ('Build docker image') {
            steps {
                sh 'docker build -t service-connect:$GIT_COMMIT .'
            }
        }
        stage ('Push docker image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-registry', url: 'https://index.docker.io/v1/') {
                    sh 'docker push service-connect:$GIT_COMMIT'
                }
            }
        }
    }
}