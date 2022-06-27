pipeline {
    agent any
    environment {
        image_name="hayja500/lbg-api-app:latest"
    }
    stages {
      stage('Test') {
            steps {
                sh "npm install"
                sh "npm test" 
            }
       }
       stage('Build') {
            steps {
                sh """
                sh "echo Building image"
                docker build -t $image_name .
                echo
                """
            }
        }
        stage('Deploy') {
            steps {
                //
                sh "echo Deploy stage"
            }
        }
    }
}

