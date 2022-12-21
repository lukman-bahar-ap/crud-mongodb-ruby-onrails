pipeline {
    agent any
    stages {
        
        stage('Build and Deploy Branch Main') {
            when {
                expression {
                    return env.GIT_BRANCH == "bitbucket/main"
                }
            }
            steps {
                sh '''
                    echo "Building and deploying branch developement "
                    ls
                    rsync -r . grumpycat@172.14.0.48:/blog-mongo-docker/crud-rails-mongodb-docker
                '''
            }
        }
    }

}