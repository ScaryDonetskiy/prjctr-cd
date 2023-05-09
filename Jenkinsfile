pipeline {
    agent { docker { image 'node:18.16.0-alpine' } }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'docker --version'
                sh 'npm install'
            }
        }
        stage('Run Eslint') {
            steps {
                sh 'npx eslint .'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
    }
}