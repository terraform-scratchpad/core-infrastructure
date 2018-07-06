
// Build Parameters
properties (
    [ parameters([
        string( name: 'ARM_CLIENT_ID', defaultValue: ''),
        string( name: 'ARM_CLIENT_SECRET', defaultValue: ''),
        string( name: 'ARM_SUBSCRIPTION_ID', defaultValue: ''),
        string( name: 'ARM_TENANT_ID', defaultValue: ''),
        string( name: 'TF_VAR_tenant_id', defaultValue: ''),
        string( name: 'TF_VAR_object_id', defaultValue: ''),
        string( name: 'TF_VAR_location', defaultValue: ''),
        string( name: 'TF_VAR_resource_group_name', defaultValue: ''),
        string( name: 'TF_VAR_owner_object_id', defaultValue: ''),
                ]),
     pipelineTriggers([
                ])
])

// Environment Variables
env.ARM_CLIENT_ID                   = ARM_CLIENT_ID
env.ARM_CLIENT_SECRET               = ARM_CLIENT_SECRET
env.ARM_SUBSCRIPTION_ID             = ARM_SUBSCRIPTION_ID
env.ARM_TENANT_ID                   = ARM_TENANT_ID
env.TF_VAR_tenant_id                = TF_VAR_tenant_id
env.TF_VAR_object_id                = TF_VAR_object_id
env.TF_VAR_location                 = TF_VAR_location
env.TF_VAR_resource_group_name      = TF_VAR_resource_group_name
env.TF_VAR_owner_object_id          = TF_VAR_owner_object_id

node {
  env.PATH += ":/usr/local/bin/"

  stage ('Checkout') {
    checkout scm
  }

  stage ('Terraform Plan') {
    sh 'terraform plan -no-color -out=create.tfplan'
  }

  // Optional wait for approval
  // input 'Deploy stack?'

  stage ('Terraform Apply') {
    sh 'terraform apply -no-color create.tfplan'
  }

  stage ('Post Run Tests') {
    echo "Insert your infrastructure test of choice and/or application validation here."
    sleep 2
    sh 'terraform show'
  }

  //stage ('Notification') {
    //mail from: "jenkins@mycompany.com",
      //   to: "devopsteam@mycompany.com",
        // subject: "Terraform build complete",
         //body: "Jenkins job ${env.JOB_NAME} - build ${env.BUILD_NUMBER} complete"
  //}
}