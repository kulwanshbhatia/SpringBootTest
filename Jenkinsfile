pipeline {
    agent {
        label 'new123'
    }
    environment {
        registry = "876270579511.dkr.ecr.eu-central-1.amazonaws.com/demo"
    }
       stages{
          stage('git'){
           steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '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', url: 'https://github.com/kulwanshbhatia/SpringBootTest']]])
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
                    sh 'docker build -t springboot .'
                    sh 'docker tag demo:latest 876270579511.dkr.ecr.eu-central-1.amazonaws.com/demo:latest'
                }
            }
        }
       stage('push docker image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u kulwanshbhatia -p ${dockerhubpwd}'
                    sh 'docker push kulwanshbhatia/demo'
}
                    
                }
            }
        }   
         stage('aws login'){
            steps{
              sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 876270579511.dkr.ecr.eu-central-1.amazonaws.com'
          }
      } 
         stage('DockerPush to AWS ECR'){
            steps{
                sh 'docker push 876270579511.dkr.ecr.eu-central-1.amazonaws.com/demo:latest'
            }
        } 
           /*
         stage ('eks Deploy') {
           steps {
               script{
                    withKubeConfig([credentialsId: 'K8s']) 
                    {
        
              sh 'kubectl apply -f Deployment.yaml'
        }
        }
    */
      }
}
                  
                  
    }
}

