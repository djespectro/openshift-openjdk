pipeline
{
  agent any
  tools {
    oc 'oc'
  }
  stages
  {
    stage('Build App') {
      steps{
        script {
          openshift.withCluster("openshift") {
            def template = openshift.withProject( "mac" ) {
              openshift.selector('template', 'template-openjdk').object()
            }
            echo "Template contains ${template.parameters.size()} parameters"
          }
        }

      }
    }// stage('Build App') {

    stage('Build Image') {
      when {
        expression {
          openshift.withCluster() {
            return openshift.selector("bc", "app").exists();
          }
        }
      }
      steps {
        script {
          openshift.withCluster("openshift") {
            openshift.withProject( "mac" ){
              openshift.selector("bc", "app").startBuild("--from-file=./target/quiz.jar", "--wait")
            }
          }
        }
      }
      }//stage('Build Image') {


      }
    }
