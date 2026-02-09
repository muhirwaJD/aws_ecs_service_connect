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
            withDockerRegistry(credentialsId: 'docker-registry') {
                steps {
                    sh 'docker push service-connect:$GIT_COMMIT'
                }
            }
        }
    }
}