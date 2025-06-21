pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Jin9837/pyinstaller-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("pyinstaller-demo")
                }
            }
        }

        stage('Run PyInstaller Binary') {
            steps {
                script {
                    docker.image("pyinstaller-demo").inside {
                        sh './dist/app'
                    }
                }
            }
        }
    }
}
