pipeline {
    agent any
    environment {
 	   registry = "anjurose/udacity-webapp"
    	   registryCredential = 'dockerhubID'
	}	
    stages {
        stage ('Build') {
		steps {
			sh 'echo "Hello World"'
		}
	}
	stage ('Linting') {
		steps {
			sh 'echo "Linting Dockerfile with Hadolint"'
			sh '/bin/hadolint Dockerfile'
		}
	
	}
	stage('Building image') {
      		steps{
        		sh 'docker build . -t registry + ":$BUILD_NUMBER"'  
     	      }
   	 }
    	stage('Deploy Image') {
      		steps{
        	 script {
          		docker.withRegistry( '', registryCredential ) {
            		dockerImage.push()
			}
		    }	
		}	
           }
	stage('Deploying to k8 cluster') {
       		echo 'Deploying to AWS...'
      		dir ('./') {
        		withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
            		sh "aws eks --region us-west-2 update-kubeconfig --name CapstoneEKS-VUUZkwHTDVPa"
            		sh "kubectl apply -f AppDeployment/udacity-capstone.yaml"
            		sh "kubectl get nodes"
            		sh "kubectl get pods"
        		}	
     		 }
    	   }
     }
}	

