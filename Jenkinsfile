pipeline {
    agent any
    environment {
 	   registry = "anjurose/udacity-webapp"
    	   registryCredential = ‘dockerhubID’
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
       		 script {
          		dockerImage = docker.build registry + ":$BUILD_NUMBER"
       		 }
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
}	

