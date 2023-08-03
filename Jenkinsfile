@Library('jenkins-shared-library') _

pipeline{
    agent any

    stages{
        stage('Git Checkout'){
            steps{  
            gitCheckout(
                branch: "main"
                url: "https://github.com/pbdinesh057/java-app-pipeline.git"
            )
            }
        }
    }
}