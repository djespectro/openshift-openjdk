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
                    echo "Hello world!"
                    script {
                        openshift.withCluster("openshift") {

                          def template = openshift.withProject( "mac" ) {
                              openshift.selector('template', 'template-openjdk').object()
                          } // Find the named template and unmarshal into a Groovy object

                          openshift.create(
                            openshift.process( template,
                              '-p', "CONTEXT_DIR=.",
                              '-p', "APPLICATION_NAME=app")
                          )
                          //----------------------

                          def bc = openshift.withProject( "mac" ) {
                              openshift.selector('bc', 'app').object()
                          } // Find the named template and unmarshal into a Groovy object
                          def buildSelector = bc.startBuild()
                          buildSelector.logs('-f')


                        }
                    }

                }
            }
        }
    }
