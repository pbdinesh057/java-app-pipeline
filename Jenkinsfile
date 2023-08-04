@Library('jenkins-shared-library') _

pipeline {
    agent any
    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'select create/destroy')
        string(name: 'ImageName', description: "Name of docker image", defaultValue: 'java_app')
        string(name: 'ImageTag', description: "Tag of docker image", defaultValue: 'v1') 
        string(name: 'DockerHubUser', description: "Docker Hub Username", defaultValue: 'pbdinesh')
    }

    stages {    
        stage('Git checkout') {
            when{
                expression { params.action == 'create'}
            }
            steps {
                // Call the gitCheckout function and provide the necessary stageParams
                gitCheckout(
                    branch: "main", 
                    url: "https://github.com/pbdinesh057/java-app-pipeline.git"
                )
            }
        }
        stage('Maven Testing') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{
                    mvnTest()  
                }
            }
        }
        stage('Maven Integration Testing') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{
                    mvnIntegrationTest()  
                }
            }
        }
        stage('Static Code Analysis') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{

                    def SonarqubeCredentialId = 'sonar-api'
                    staticCodeAnalysis(SonarqubeCredentialId)

                }
            }
        }

        stage('Quality gate check') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{

                    def SonarqubeCredentialId = 'sonar-api'
                    qualityGatestatus(SonarqubeCredentialId)
                      
                }
            }
        }
        stage('Maven Build: Maven') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{
                    mvnBuild()
                      
                }
            }
        }
        stage('Docker Image Build: Docker') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{
                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                      
                }
            }
        }
        stage('Docker Image Scan: Trivy') {
            when{
                expression { params.action == 'create'}
            }
            steps{
                script{
                    dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                      
                }
            }
        }
        // Add more stages as needed
    }
}