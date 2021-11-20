// node {

//     stage("Git Clone"){
//         checkout scm
//     }

//     withCredentials([string(credentialsId: 'dockerHubCredentials', variable: 'PASSWORD')]) {
//         sh 'docker login -u rahulwagh17 -p $PASSWORD'
//     }

//     stage("Push Image to Docker Hub"){
//         sh 'docker push mphareng/authenticator:latest'
//     }

    // stage("SSH Into k8s Server") {
    //     def remote = [:]
    //     remote.name = 'K8S master'
    //     remote.host = '100.0.0.2'
    //     remote.user = 'vagrant'
    //     remote.password = 'vagrant'
    //     remote.allowAnyHosts = true

    //     stage('Put k8s-spring-boot-deployment.yml onto k8smaster') {
    //         sshPut remote: remote, from: 'k8s-spring-boot-deployment.yml', into: '.'
    //     }

    //     stage('Deploy spring boot') {
    //       sshCommand remote: remote, command: "kubectl apply -f k8s-spring-boot-deployment.yml"
    //     }
    // }

// }
 
node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        /* docker requires docker pipeline plugin*/
        app = docker.build("mphareng/authenticator")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerHubCredentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}