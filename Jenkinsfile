pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/loic1805/QualiteDev'
            }
        }

        stage('Build') {
            steps {
                echo 'Compilation du programme...'
                sh 'make clean && make all'
            }
        }

        stage('Test') {
            steps {
                echo 'Exécution des tests...'
                sh 'bash test/test_bubble.sh'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: '**/output.txt', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé'
        }
        failure {
            echo 'Build ou test échoué !'
        }
    }
}
