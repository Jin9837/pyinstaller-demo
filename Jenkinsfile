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
                sh '/usr/local/bin/docker build -t pyinstaller-demo .'
            }
        }

        stage('Run PyInstaller Binary') {
            steps {
                sh '/usr/local/bin/docker run --rm pyinstaller-demo'
            }
        }
    }
}
