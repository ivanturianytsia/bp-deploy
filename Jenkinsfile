node {
    checkout scm
    try {
        stage("Check Docker Machine") {
            sh 'chmod -R 777 .'
            sh 'bash deploy.sh check'
        }
    } catch(err) {
        stage("Create Docker Machine") {
            sh 'bash deploy.sh create'
        }
    }

    try {
        stage("Deploy Docker Stack") {
            sh 'bash deploy.sh deploy'
        }
    } catch(err) {
        throw err
    } finally {
        stage("Cleanup") {
            sh 'rm -rf *'
        }
    }
}
