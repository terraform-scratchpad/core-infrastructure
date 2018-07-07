


def generator = { String alphabet, int n ->
  new Random().with {
    (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
  }
}

pipeline {

    agent {
        node {
            label 'master'
        }
    }

    environment {
        TERRAFORM_CMD='/usr/local/bin/terraform'
    }

    stages {

      stage ('Checkout') {
        steps {
            checkout scm
        }
      }

      stage ('Terraform Init') {
        steps {
            sh '${TERRAFORM_CMD} init -plugin-dir=/tmp/plugins'
        }
      }

      stage ('Terraform Workspace') {
        steps {
            sh '${TERRAFORM_CMD} workspace new core-infrastructure-generator( ((\'A\'..\'Z\')+(\'0\'..\'9\')).join(), 9 )'
        }
      }

      stage ('Terraform Plan') {
        steps {
            sh '${TERRAFORM_CMD} plan -no-color'
        }
      }

      stage ('Terraform Apply') {
        steps {
            sh '${TERRAFORM_CMD} apply -no-color'
        }
      }

      stage ('Post Run Tests') {
        steps {
            echo "Insert your infrastructure test of choice and/or application validation here."
            sleep 2
            sh '${TERRAFORM_CMD} show'
        }
      }
    }
}
