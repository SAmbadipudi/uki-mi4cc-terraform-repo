#!groovy

// Terraform apply or plan via the Makefile
def TerraApply(String LayerToDeploy, String Environment, String TerraAction) {
    // force all non apply requests to plan
    // if (TerraAction != 'apply') {
    //     TerraAction = 'plan'
    // }
    sh """
        echo "=== Terraform ${TerraAction} for ${LayerToDeploy} in ${Environment} ==="
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make first-run
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make init
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make ${TerraAction}
        """
}

pipeline {
    agent { label 'linux-01' }
    parameters {
            booleanParam(name: 'cloudwatch-event-rules', defaultValue: false, description: 'Create cloudwatch events rules')
            booleanParam(name: 'cloudwatch-sns', defaultValue: false, description: 'Create cloudwatch events rule for sns notifications')
            booleanParam(name: 'glue-job', defaultValue: false, description: 'Glue Job Process')
            booleanParam(name: 'glue-db', defaultValue: false, description: 'Glue DB connection')
            booleanParam(name: 'secrets-manager', defaultValue: false, description: 'Store DB credentials in secrets manager')
            booleanParam(name: 's3', defaultValue: false, description: 'S3 buckets')
            booleanParam(name: 'sns', defaultValue: false, description: 'Notifications')
            choice(name: 'Environment', choices: 'DEV', description: 'Select Environment')
            choice(name: 'Action', choices: 'plan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
        stage('Download Repositories') {
           environment {
                AWS_CREDENTIALS = credentials('uki_iam_user_backoffice_jenkins')
                AWS_ACCESS_KEY_ID = "${env.AWS_CREDENTIALS_USR}"
                AWS_SECRET_ACCESS_KEY = "${env.AWS_CREDENTIALS_PSW}"
           }

           steps {
                dir ('modules') {
                    checkout([
                        $class: 'GitSCM', branches: [[name: '*/master']],
                        extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'uki-mi4cc-terraform-modules']],
                        userRemoteConfigs: [[url: 'git@bitbucket.org:tui-uk-dev/uki-mi4cc-terraform-modules.git',
                        credentialsId:'21090fbd-d209-404d-9ad1-94d27279c940']]
                    ])
                }

                script {
                    if (params.cloudwatch-event-rules == true) {
                        TerraApply("cloudwatch-event-rules", params.Environment, params.Action)
                    }
		    if (params.cloudwatch-sns == true) {
                        TerraApply("cloudwatch-sns", params.Environment, params.Action)
                    }
                   if (params.'glue-job' == true) {
                        TerraApply("glue-job", params.Environment, params.Action)
                    }
                    if (params.'glue-db' == true ) {
                        TerraApply("glue-db", params.Environment, params.Action)
                    }
                    if (params.'secrets-manager' == true) {
                        TerraApply("secrets-manager", params.Environment, params.Action)
                    }
                    if (params.s3 == true ) {
                        TerraApply("s3", params.Environment, params.Action)
                    }
                    if (params.sns == true ) {
                        TerraApply("sns", params.Environment, params.Action)
                    }

                }
            }
        }

    }//stages
}//pipeline
