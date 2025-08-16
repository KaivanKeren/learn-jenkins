pipeline {
	agent any

    environment {
		DOCKERHUB_CREDENTIALS = credentials('dockerhub-id') // simpan di Jenkins
        IMAGE_NAME = "dummy-app"
        IMAGE_TAG = "latest"
    }

    stages {
		stage('Checkout') {
			steps {
				git 'https://github.com/username/dummy-app.git'
            }
        }

        stage('Build Docker Image') {
			steps {
				sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Push Docker Image') {
			steps {
				withDockerRegistry([credentialsId: 'dockerhub-id', url: '']) {
					sh 'docker tag $IMAGE_NAME:$IMAGE_TAG username/$IMAGE_NAME:$IMAGE_TAG'
                    sh 'docker push username/$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }
}
