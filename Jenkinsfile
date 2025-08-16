pipeline {
	agent any

    environment {
		DOCKERHUB_CREDENTIALS = credentials('dockerhub-id') // simpan di Jenkins
        IMAGE_NAME = "learn-jenkins"
        IMAGE_TAG = "latest"
    }

    stages {
		stage('Checkout') {
			steps {
				git 'https://github.com/KaivanKeren/learn-jenkins.git'
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
					sh 'docker tag $IMAGE_NAME:$IMAGE_TAG KaivanKeren/$IMAGE_NAME:$IMAGE_TAG'
                    sh 'docker push KaivanKeren/$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }
}
