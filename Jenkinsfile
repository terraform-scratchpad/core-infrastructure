pipeline {
    agent {
        node {
            label 'master'
        }
    }

    environment {
        TERRAFORM_CMD='/usr/local/bin/terraform'
        BUILD_PROPERTIES_PATH='/usr/local/bin'
    }

    stages {

      stage ('Checkout') {
        steps {
            checkout scm
        }
      }

      stage ('Terraform Init') {
        steps {
            //load "$BUILD_PROPERTIES_PATH/build.groovy"
            sh '${TERRAFORM_CMD} init'
        }
      }

      stage ('Terraform Plan') {
        steps {
            //load "$BUILD_PROPERTIES_PATH/build.groovy"
            sh '${TERRAFORM_CMD} plan -no-color'
        }
      }

    }
}
