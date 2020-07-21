node{
   stage('SCM Checkout'){    
       git credentialsId: 'git-creds', url: 'https://github.com/kishan428/spring-petclinic.git'  
   }
   stage('Mvn Package'){   
     def mvnHome = tool name: 'maven-3', type: 'maven'
     def mvnCMD = "${mvnHome}/bin/mvn"
     sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
     sh 'docker build -t kishan428/spring-petclinic:2.0.0 .'
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u kishan428 -p ${dockerHubPwd}"
     }
     sh 'docker push kishan428/spring-petclinic:2.0.0'
   }
   stage('Run docker on Dev Server'){
     def dockerUpdate = 'sudo apt-get update -y'
     def dockerInstall = 'sudo apt install docker.io -y'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.221.246.100 ${dockerUpdate}"
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.221.246.100 ${dockerInstall}"
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.221.246.100 sudo systemctl start docker"
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.221.246.100 sudo usermod -aG docker ubuntu"
     }
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8082:8082 -d --name my-app kishan428/spring-petclinic:2.0.0'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.221.246.100 ${dockerRun}"
     }
   }
}
