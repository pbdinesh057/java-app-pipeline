pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                // Call the gitCheckout function and provide the necessary stageParams
                gitCheckout(stageParams: [branch: 'main', url: 'https://github.com/pbdinesh057/java-app-pipeline.git'])
            }
        }
        // Add more stages as needed
    }
}
