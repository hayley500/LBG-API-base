pipeline {
    agent any
    environment {
        APP_NAME="lbg-api-app"
        TAG="latest"
        DOCKERHUB_CREDS=credentials("DOCKERHUB_CREDS")
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
                echo "Building image:"
                docker build -t ${DOCKERHUB_CREDS_USR}/${APP_NAME}:${TAG} .
                echo
                """
            }
        }
        stage('Push') {
            steps {
                sh "docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW"
                sh """
                echo "Push image to registry:"
                docker push ${DOCKERHUB_CREDS_USR}/${APP_NAME}:${TAG}
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

