pipeline {
    agent {
        label 'sana_123'
    }
      stages{
        stage('git'){
           steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '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', url: 'https://github.com/sanataba/SpringBootTest']]])
           }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        } 
        stage('docker build'){
            steps{
                script{
                    sh 'docker build -t sanataba/springboot .'
                }
            }
        }
        stage('push docker image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u sanataba -p ${dockerhubpwd}'
                    sh 'docker push sanataba/springboot'
}
                    
                }
            }
        }
    }
}

