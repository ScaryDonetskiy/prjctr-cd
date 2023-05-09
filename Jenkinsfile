pipeline {
    agent { docker { image 'node:18.16.0-alpine' } }
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
            agent { label 'jenkins-docker' }
            steps {
                sh 'docker pull node'
            }
        }
        stage('Deploy') {
            steps {
                input 'Deploy?'
            }
        }
    }
}