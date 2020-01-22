pipeline {
    agent any
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
	stage ('Push to DockerHub')
		steps {
			sh './run_docker.sh'
			sh './upload_docker.sh'
			}
		}
     }
}	

