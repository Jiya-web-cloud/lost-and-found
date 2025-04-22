pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = '123456'  // Replace with your Docker Hub credentials ID
        GITHUB_CREDENTIALS = '12345'  // Replace with your GitHub credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub using GitHub credentials and main branch
                git credentialsId: GITHUB_CREDENTIALS, url: 'https://github.com/Jiya-web-cloud/lost-and-found.git', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub using the Docker Hub credentials
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS) {
                        // Build the Docker image using the Dockerfile in the repository
                        def customImage = docker.build('devjiya01/lost-and-found')
                        // Push the Docker image to Docker Hub
                        customImage.push()
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
        success {
            echo 'Build and Docker operations completed successfully.'
        }
        failure {
            echo 'There was an issue with the build or Docker operations.'
        }
    }
}