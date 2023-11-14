pipeline {
    agent any

    environment {
        // Define environment variables if needed
    }

    stages {
        stage('Build') {
            steps {
                // Building the Docker image
                sh 'docker build -t message-service .'
            }
        }
        stage('Test') {
            steps {
                // Running tests (assuming you have a test script)
                sh 'python manage.py test'
            }
        }
        stage('Deploy') {
            steps {
                // Pushing the Docker image to a registry
                // Replace 'your-registry' with your actual registry
                sh 'docker push your-registry/message-service:latest'

                // Applying the Kubernetes secret for database details
                sh 'kubectl apply -f path/to/database_details_secret.yaml'

                // Applying the Kubernetes secret for AWS credentials
                sh 'kubectl apply -f path/to/aws_credentials_secret.yaml'

                // Deploying the message service
                sh 'kubectl apply -f path/to/message_service_deploy.yaml'
            }
        }
    }

    post {
        always {
            // Slack notification
            script {
                if (currentBuild.result == 'SUCCESS') {
                    slackSend (color: '#00FF00', message: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                } else {
                    slackSend (color: '#FF0000', message: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                }
            }
        }
    }
}
