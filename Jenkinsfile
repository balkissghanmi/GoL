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
                    // Install GoSec if it's not already installed
                    sh 'go install github.com/securego/gosec/v2/cmd/gosec@latest'
                    // Run GoSec and output results to 'gosec-report.json'
                    sh 'gosec -fmt=json -out=gosec-report.json ./...'
                }
            }
        }
    }
    
    }