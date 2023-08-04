@Library('jenkins-shared-library') _

pipeline {
    agent any
    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'select create/destroy')
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
                    staticCodeAnalysis()  
                }
            }
        }
        // Add more stages as needed
    }
}
