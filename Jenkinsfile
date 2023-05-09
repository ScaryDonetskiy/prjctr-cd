pipeline {
    agent none
    stages {
        stage('Run Checks') {
            agent { docker { image 'node:18.16.0-alpine' } }
            stage('Install Dependencies') {
                steps {
                    sh 'npm install --include-dev'
                }
            }
            stage('Run Checks') {
                parallel {
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
        }
        stage('Build') {
            agent { docker { image 'php:latest' } }
            steps {
                sh 'php -v'
            }
        }
    }
}