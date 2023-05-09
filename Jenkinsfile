pipeline {
    agent any
    stages {
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
        stage('Build') {
            steps {
                sh 'node --version'
            }
        }
    }
}