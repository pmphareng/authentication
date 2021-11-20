pipeline {
    agent any
    stages {
        stage('build'){
            steps {
                echo 'executing yarn'
                nodejs('Node-16.3.0'){
                    sh 'yarn install'
                }
            }
        }
    }
}