pipeline {
  environment {
    registry = "04193007/capstone"
    registryCredential = 'dockerhub'
    dockerImage = ''
}
	agent any
	stages {
		stage('Lint HTML'){
			steps {
				sh 'tidy -q -e index.html'
				
			}
		}
        stage('Build Docker Container'){
            steps {
                    script {
              dockerImage = docker.build(registry)
            }
      }
    }
        stage('Build & Push to dockerhub'){
            steps {
                    script {
                docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning Docker up') {
            steps {
                script {
                    sh "echo 'Cleaning Docker up'"
                    sh "docker system prune -f"
                    }
                }
            }
        stage('Create K8s Cluster') {
            steps {
                withAWS(region:'eu-central-1', credentials:'AWSAdmin'){
                    sh '''
                            eksctl create cluster \
                            --name capstonecluster \
                            --version 1.17 \
                            --region eu-central-1 \
                            --nodegroup-name standard-nodes \
                            --node-type t2.micro \
                            --nodes 2 \
                            --nodes-min 1 \
                            --nodes-max 4 \
                            --zones eu-central-1a \
						    --zones eu-central-1b \
						    --zones eu-central-1c \
                        '''
            }
        }
    }
    	stage('Create config file cluster') {
			steps {
				withAWS(region:'eu-central-1', credentials:'AWSAdmin') {
					sh '''
						aws eks --region eu-central-1 update-kubeconfig --name capstonecluster
					'''
		    	}
    		}
	    }    
    }
}
