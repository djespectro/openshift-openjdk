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
                        def template = openshift.withCluster("openshift") {
                          openshift
                            .withProject( "mac" )
                            .selector('template', 'template-openjdk')
                            .object()
                        }
                        echo "Template contains ${template.parameters.size()} parameters"
                    }

                }
            }

            // stage('Build Image') {
            //   steps {
            //     script {
            //       openshift.withCluster("openshift") {
            //         openshift.withProject( "mac" ){
            //           openshift.selector("bc", "mapit").startBuild("--from-file=target/mapit-spring.jar", "--wait")
            //         }
            //       }
            //     }
            //   }
            // }//stage('Build Image') {


        }
    }
