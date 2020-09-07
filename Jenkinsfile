pipeline {
  environment {
    registry = "04193007/capstone"
    registryCredential = 'dockerhub'
    dockerImage = ''

	agent any
	environment {
		registry = "04193007/capstone"
		registryCredential = 'dockerhub'
	}
	
	stages {
		stage('Lint HTML'){
			steps {
				sh 'tidy -q -e index.html'
				
			}
		}
    stage('Build Docker Container') {
      steps {
        script {
          dockerImage = docker.build(registry)
        }
      }
    }
    stage('Build & Push to dockerhub') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    stage("Cleaning Docker up") {
            steps {
                script {
                    sh "echo 'Cleaning Docker up'"
                    sh "docker system prune -f"
                }
            }
        }
      }
  }
  }