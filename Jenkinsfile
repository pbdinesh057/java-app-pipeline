@Library('jenkins-shared-library') _

pipeline {
    agent any
    parameters{

        choice(name: 'action', choice: 'create\ndelete', description: 'select create/destroy')
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
            steps{
                when{
                    expression { params.action == 'create'}
                }
                script{
                    mvnIntegrationTest()  
                }
            }
        }
        stage('Static Code Analysis') {
            steps{
                when{
                    expression { params.action == 'create'}
                }
                script{
                    staticCodeAnalysis()  
                }
            }
        }
        // Add more stages as needed
    }
}
