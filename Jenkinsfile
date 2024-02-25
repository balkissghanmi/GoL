pipeline {
  
    agent any
    tools{
        go '1.22.0'
    }
    environment {
    PATH = "/usr/local/go/bin:${env.PATH}"
    DOCKERHUB_USERNAME = 'balkissd'
    STAGING_TAG = "${DOCKERHUB_USERNAME}/go:v1.0.0"
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
    //     stage('SonarQube Analysis') {
    //         steps {
    //             script {
    //                      sh 'pwd'
    //                      sh  '/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=Go -Dsonar.sources=. -Dsonar.host.url=http://192.168.56.20:9000 -Dsonar.login=sqp_9847d1d46f67de8600e3ba5196e5a85b4059a3a9'
    //         }
    //     }
    // }
    stage('Docker'){
        steps {
            script{
                sh "docker build -t ${STAGING_TAG} ."
                withCredentials([usernamePassword(credentialsId: 'tc', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                sh "docker push ${STAGING_TAG}"
            }
        }
    }
    }
    
    }
    
    }