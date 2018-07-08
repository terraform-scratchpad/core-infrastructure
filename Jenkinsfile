




pipeline {

    agent {
        node {
            label 'master'

            if (!fileExists('/usr/local/bin/terraform.properties')) {
                exit
            }

            def tf_props = readProperties file: '/usr/local/bin/terraform.properties'

            env.ARM_CLIENT_ID                   = tf_pros["ARM_CLIENT_ID"]
            env.ARM_CLIENT_SECRET               = tf_pros["ARM_CLIENT_SECRET"]
            env.ARM_SUBSCRIPTION_ID             = tf_pros["ARM_SUBSCRIPTION_ID"]
            env.ARM_TENANT_ID                   = tf_pros["ARM_TENANT_ID"]
            env.TF_VAR_tenant_id                = tf_pros["TF_VAR_tenant_id"]
            env.TF_VAR_object_id                = tf_pros["TF_VAR_object_id"]
            env.TF_VAR_location                 = tf_pros["TF_VAR_location"]
            env.TF_VAR_resource_group_name      = tf_pros["TF_VAR_resource_group_name"]
            env.TF_VAR_owner_object_id          = tf_pros["TF_VAR_owner_object_id"]
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
            sh '${TERRAFORM_CMD} init'
        }
      }

      //stage ('Terraform Workspace') {
      //  steps {
      //      sh '${TERRAFORM_CMD} workspace new core-infrastructure-generator( ((\'A\'..\'Z\')+(\'0\'..\'9\')).join(), 9 )'
      //  }
      //}

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
