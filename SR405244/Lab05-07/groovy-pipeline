pipeline{
    agent any
    environment {
        DOCKER_BUILD_DIR = 'INO/GCL2/SR405244/Lab05-07'
        REPO_NAME = 'MDO2023_INO'
        def version = sh (script: 'echo ${BUILD_NUMBER}', returnStdout: true).trim()
    }

    stages {
        stage('Cleanup') {
            steps{
                script{
                    sh 'echo "Start Cleanup"'
                    // sh 'docker container stop go_deploy_cont'
                    sh 'docker container prune --force'
                    sh 'docker image prune --all --force'
                    sh 'docker container ls -a'
                    sh 'docker images'
                    sh 'echo "Cleanup finished"'
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh 'echo "Start Build"'
                    sh "rm -rf *"
                    sh "git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2023_INO.git"
                    dir('MDO2023_INO') {
                        sh "pwd"
                        sh "ls -la"
                        sh "git branch -a "
                        sh "git checkout SR405244" 
                        sh "docker build -t go_build_img -f ${DOCKER_BUILD_DIR}/go_build ${DOCKER_BUILD_DIR}"
                        sh 'docker run -d --name go_build_cont go_build_img'
                        sh 'docker cp go_build_cont:/app/REST_API_calculator_for_Jenkins_pipeline/REST_API_calculator_for_Jenkins_pipeline /var/jenkins_home/workspace/API_calc_pipe/MDO2023_INO'
                        sh 'docker stop go_build_cont'
                        sh 'docker rm -f go_build_cont'
                        sh 'docker container ls -a'
                        sh "ls -la"
                    }
                    sh 'echo "Build finished"' 
                }
            }
        }
        
        stage('Test') {
		    steps {
		        script {
		          sh 'echo "Start Test"'
		            dir('MDO2023_INO') {
		                sh 'docker build -t go_test_img -f ${DOCKER_BUILD_DIR}/go_test ${DOCKER_BUILD_DIR}'
		                sh 'docker container ls -a'
		                sh 'docker run --name go_test_cont go_test_img'
		                sh 'echo "Below logs for tests:\n" > test_logs.txt'
                        sh 'docker logs go_test_cont >> test_logs.txt'
                        sh 'cat test_logs.txt'
                        archiveArtifacts 'test_logs.txt'
                        sh 'docker stop go_test_cont'
                        sh 'docker rm -f go_test_cont'
                        def test_logs = readFile 'test_logs.txt'
                        if (test_logs.contains('FAIL')) {
                            error 'Tests failed, cannot proceed with the pipeline processes!'
                        }
		            }
		          sh 'echo "Test finished"'
		        }
		    }
	    }
	    
        stage('Deploy') {
          steps {
            sh 'echo "Start Deploy"'
            script {
              dir('MDO2023_INO') {
                sh "docker build -t go_deploy_img:latest -f ${DOCKER_BUILD_DIR}/go_deploy ${DOCKER_BUILD_DIR}"
                sh "docker run -d -p 3001:3001 --name go_deploy_cont go_deploy_img:latest"
                sleep(5)
                sh "docker logs go_deploy_cont"
                sh "docker ps -a"
                sh "ls -a"
                // // Doesn't respond at pipeline stage but works perfectly fine as pulled image from DockerHub
                // sh 'sudo apt-get update'
                // sh 'sudo apt-get install wget -y'
                // sh 'curl http://localhost:3001/hello'
                // sh 'wget --header="Content-Type: application/json" --post-data="[5, 1]" http://localhost:3001/add'
                //// Also doesn't see files even if they exist in directory 
                // dir("/INO/GCL2/SR405244/Lab05-07/"){
                //     sh "ls -a"
                //     sh "pwd"
                //     sh "bash test_GET.sh > test_post_logs.txt"
                //     sh "bash test_POST.sh >> test_post_logs.txt"
                //     def test_post_logs = readFile 'test_post_logs.txt'
                //     if (test_post_logs.contains('FAIL')) {
                //         error 'Tests failed, cannot proceed with the pipeline processes!'
                //     }
                // }
                // sh 'cat test_post_logs.txt'
                // archiveArtifacts 'test_post_logs.txt'
                
                sh "docker container stop go_deploy_cont"
                sh "docker container rm -f go_deploy_cont"
              }
            }
            sh 'echo "Deploy finished"'
          }
        }
	    
        stage('Publish') {
            steps {
                    sh 'echo "Start Publish"'
                    withCredentials([usernamePassword(credentialsId: 'my-dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        script {
                            sh 'echo "Start Publish"'
                            sh 'docker images'
                            // sh 'docker login -u $DOCKER_USERNAME --password-stdin' // cannot perfomr on not TTY device
                            sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                            sh 'docker tag go_deploy_img:latest $DOCKER_USERNAME/go-deploy-img:${version}'
                            sh 'docker push $DOCKER_USERNAME/go-deploy-img:${version}'
                            sh 'docker images'
                        }
                    }
                    sh 'echo "Publish finished"'
                } 
        }
    }
}
