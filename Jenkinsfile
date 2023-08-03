@Library('jenkins-shared-library') 

pipeline{
    agent any

    stages{

        stage('Git Checkout'){
            steps{
                script{
                    gitCheckout(
                        branchL "main"
                        url: "https://github.com/pbdinesh057/java-app-pipeline.git"
                    )
                }
            }
        }
    }
}