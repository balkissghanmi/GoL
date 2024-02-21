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
                }
            }
        }
    }
    
    }