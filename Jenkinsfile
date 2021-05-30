node {
  def commit_id
  stage('Preparation') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                        
     commit_id = readFile('.git/commit-id').trim()
   }
  stage ('Build') {
    withMaven {
      sh "mvn clean install"
    } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
  }
  stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("chandrakantparadkar/mytwitter:${commit_id}", '.').push()
     }
  }
}
