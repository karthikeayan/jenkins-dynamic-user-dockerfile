#!groovy

pipeline {

    environment {
            JENKINS_USER_NAME = "${sh(script:'id -un', returnStdout: true).trim()}"
            JENKINS_USER_ID = "${sh(script:'id -u', returnStdout: true).trim()}"
            JENKINS_GROUP_ID = "${sh(script:'id -g', returnStdout: true).trim()}"
    }
    agent {
        dockerfile {
            filename 'Dockerfile.build'
            additionalBuildArgs """\
            --build-arg GID=${env.JENKINS_GROUP_ID} \
            --build-arg UID=${env.JENKINS_USER_ID} \
            --build-arg UNAME=${env.JENKINS_USER_NAME} \
            """
        }
    }

    stages {
        stage('Build Dependencies') {
            steps {
                sh "pip install -r requirements.txt"
            }
        }
}
    post {
        always {
            sh "Job finished"
        }
    }
}
