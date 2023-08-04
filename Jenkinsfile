@Library('jenkins-shared-library') _

pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                // Call the gitCheckout function and provide the necessary stageParams
                gitCheckout(
                    branch: "main", 
                    url: "https://github.com/pbdinesh057/java-app-pipeline.git"
                )
            }
        }
        stage('Maven Testing') {
            steps{
                script{
                    mvnTest()  
                }
            }
        }
        stage('Maven Integration Testing') {
            steps{
                script{
                    mvnIntegrationTest()  
                }
            }
        }
        // Add more stages as needed
    }
}
