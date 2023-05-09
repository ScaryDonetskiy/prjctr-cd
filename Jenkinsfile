pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            agent { docker { image 'node:18.16.0-alpine' } }
            steps {
                sh 'npm install --include-dev'
            }
        }
        stage('Run Eslint') {
            agent { docker { image 'node:18.16.0-alpine' } }
            steps {
                sh 'npx eslint .'
            }
        }
        stage('Run Tests') {
            agent { docker { image 'node:18.16.0-alpine' } }
            steps {
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'docker --version'
            }
        }
    }
}