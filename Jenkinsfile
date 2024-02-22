pipeline {
  
    agent any
    tools{
        go '1.22.0'
    }
    environment {
    PATH = "/usr/local/go/bin:${env.PATH}"
}
    stages {
        stage("go version") {
            steps {
                sh 'pwd'
                sh ' go version'
                sh '/usr/local/go/bin/go build -o goL'
                sh '/usr/local/go/bin/go test'

            }
        }
        stage("GoSec Security Scan") {
            steps {
                script {
                    
                    // Run GoSec and output results to 'gosec-report.json'
                    sh 'gosec -fmt=json -out=gosec-report.json ./...'
                    sh 'golangci-lint run ./... > golangci-report.txt'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                         sh 'pwd'
                         sh  '/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=jenkins-sonarqube-token -Dsonar.sources=. -Dsonar.host.url=http://192.168.56.20:9000 -Dsonar.login=sqa_ed405358e620f6865067d0bdc8c4a651ce6b3ce1 '
            }
        }
    }
    }
    
    }