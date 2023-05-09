pipeline {
    stages {
        stage('Run Checks') {
            agent { docker { image 'node:18.16.0-alpine' } }
            stage('Install Dependencies') {
                steps {
                    sh 'npm install --include-dev'
                }
            }
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
                sh 'echo Hello World'
            }
        }
    }
}