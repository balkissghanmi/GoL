pipeline {
  
    agent any
    tools{
        go '1.22.0'
    }
    environment {
    PATH = "/usr/local/go/bin:${env.PATH}"
    DOCKERHUB_USERNAME = 'balkissd'
    STAGING_TAG = "${DOCKERHUB_USERNAME}/go:v1.0.0"
    SEMGREP_APP_TOKEN = '1c87866c63498142b962151e4b3f762e2d7b7b5985048391c299968d474708b8'
}
    stages {
        stage('Checkout Git') {
            steps {
                script {
                    git branch: 'main',
                        url: 'https://github.com/balkissghanmi/GoL.git',
                        credentialsId: 'test' 
                }
            }
        }
        stage("Go Build and Test") {
            steps {
                sh 'pwd'
                sh ' go version'
                sh '/usr/local/go/bin/go build -o goL'
                sh '/usr/local/go/bin/go test'
                sh 'gosec ./...'
                sh 'golangci-lint run ./... '
            }
        }
        // stage("Go SAST") {
        //     steps {
        //         script {
        //         //sh"docker run -e SEMGREP_APP_TOKEN=1c87866c63498142b962151e4b3f762e2d7b7b5985048391c299968d474708b8 --rm -v /var/lib/jenkins/workspace/GoL:/goSem -w /goSem semgrep/semgrep semgrep ci"
                
        //         }
        //     }
        // }

//    stage('SonarQube Analysis') {
//       steps {
//         script {
//         withSonarQubeEnv (installationName: 'sonarqube-scanner') {
//           sh "/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=${SONARKEY} -Dsonar.sources=. -Dsonar.host.url=${SONARURL} -Dsonar.login=${SONARLOGIN} "
//         }
//       }
//     }
//     }

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