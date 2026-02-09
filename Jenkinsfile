pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Build docker image') {
            steps {
                sh 'docker build -t service-connect:$GIT_COMMIT .'
            }
        }
        stage ('Push docker image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-registry') {
                    sh 'docker push service-connect:$GIT_COMMIT'
                }
            }
        }
    }
}