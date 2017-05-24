node {
  checkout scm
  try {
    stage("Deploy") {
      if ( fileExists 'test1' ) {

      }
      sh 'docker stack deploy -c docker-compose.yml socialpoll'
    }
  } catch(error) {
    throw error
  } finally {
    sh 'rm -rf *'
  }
}
