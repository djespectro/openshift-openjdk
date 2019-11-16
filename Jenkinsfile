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
                                echo "Template contains ${template.parameters.size()} parameters"    // Explore the template model

                        }
                    }

                }
            }
        }
    }
