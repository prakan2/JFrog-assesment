# JFrog-assesment

 ![image](https://user-images.githubusercontent.com/39775218/164751465-4a823ee8-4e09-40d4-987c-ad72beee89a2.png)

Tools involved:
1) Github 
2) Jenkins
3) docker
4) JFrog
5) ubuntu machine to host 
6) docker for windows
To setup the infra I first installed Jenkins on ubuntu machine. Below is the link for reference:-
https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04 
Once the Jenkins was up, I installed all the relevant plugins , docker, artifactory, git etc
Then I installed docker on ubuntu machine below is the link for reference
https://docs.docker.com/engine/install/ubuntu/ 
Then created a free cloud account for JFrog artifactory.

Once the infrastructure was up and running, I followed the below steps to start with the assignment.
1. First, logged into GitHub from any web browser. Then forked the Spring PetClinic repository (the example application we’ll use). 
2. Cloned the spring-petclinic repo on my local repo. for eg:- prakan2/JFrog-assesment (github.com)
$ git clone https://github.com/shanemacbride/spring-petclinic.git 
$ cd spring-petclinic

   3. Provided maven and gradle read write permissions .
                           sh "chmod 755 gradlew"
                                sh "chmod 755 mvnw"
4.  Executed the maven clean, maven install steps to build and test the application.
                              sh "./mvnw clean"
                              sh "./mvnw install”
5. Once the above steps gets executed successfully, we are good to package our application run       
                             sh "./mvnw package

6. The package generates a .jar file in the target folder as spring-petclinic-2.6.0-SNAPSHOT.jar

7. The jar file can be run manually on the local machine as 
                                  java -jar target/*.jar

All the above steps are included in the Jenkinsfile and committed to the git repo .
    JFrog-assesment/Jenkinsfile at main · prakan2/JFrog-assesment (github.com)

Once the image gets built it creates an image with the help of Dockerfile which is part of the Jenkinsfile. JFrog-assesment/Dockerfile at main · prakan2/JFrog-assesment (github.com)
And the dockerfile is also committed to the git repo.

Once the image assessment_jenkins is generated with the help of docker you can check for the image in two ways 
1) docker ps 
           ![image](https://user-images.githubusercontent.com/39775218/164751640-2f50f2e2-20a7-4d70-9f49-9a7a5506d5d1.png)

                  
2) in the docker for windows
            ![image](https://user-images.githubusercontent.com/39775218/164751688-7813a203-cf72-4307-89f7-5eb17182c217.png)

	

Once we have the image created we can upload the image into the JFrog artifactory with the following steps :-

1) Generate a token in the Jfrog instance and also create a private docker repo inside Jfrog. Here it is qwerty
2) docker login to the Jfrog instance 
             ![image](https://user-images.githubusercontent.com/39775218/164751789-8d3db3b2-b676-403e-a119-3f27dd75b4d5.png)

3) check for the available images via docker ps command
             ![image](https://user-images.githubusercontent.com/39775218/164751826-4ed0fce1-94e6-4327-aaba-a03619df3a59.png)

4) tag the available image if not already  
             ![image](https://user-images.githubusercontent.com/39775218/164751942-9174f087-e308-408d-b35b-15578a510117.png)

5) push the image into the jfrog instance  
             ![image](https://user-images.githubusercontent.com/39775218/164752003-2e368f95-4208-4323-89b4-57aa2350ae14.png)

6) once pushed we can check it on the Jfrog if the image is available  
             ![image](https://user-images.githubusercontent.com/39775218/164752056-c9f58d6b-5714-4beb-8367-f3dd8e853c5c.png)

Finally the image build can be run in two ways :-

1) docker run command 
          docker run --name JFrog_assessment -d  -p 8080:8080 assesment_jenkins:latest
2) via docker desktop .
       check on the image -> click on run -> provide a container name along with the ports to expose -> click submit .
             ![image](https://user-images.githubusercontent.com/39775218/164752155-e7c2ed12-8440-4ad5-a08d-c469c1aecc1a.png)

This will launch the spring-clinic web port on port 8080.
             ![image](https://user-images.githubusercontent.com/39775218/164752237-7727c28d-3e99-4fe2-8671-2045c1852618.png)

 
Jenkins Job for assessment with github webhook enabled 
             ![image](https://user-images.githubusercontent.com/39775218/164752295-cd1ad453-1d42-4093-b78a-8194db31a4ca.png)



The source code is on the below repository :-
https://github.com/prakan2/JFrog-assesment.git  
