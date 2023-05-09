pipeline {
    agent none
    stages {
        stage('Install Dependencies') {
            agent {
                docker {
                    image 'node:18.16.0-alpine'
                    reuseNode true
                }
            }
            steps {
                sh 'npm install --include-dev'
            }
        }
        stage('Run Checks') {
            parallel {
                stage('Run Eslint') {
                    agent {
                        docker {
                            image 'node:18.16.0-alpine'
                            reuseNode true
                        }
                    }
                    steps {
                        sh 'npx eslint .'
                    }
                }
                stage('Run Tests') {
                    agent {
                        docker {
                            image 'node:18.16.0-alpine'
                            reuseNode true
                        }
                    }
                    steps {
                        sh 'npm test'
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