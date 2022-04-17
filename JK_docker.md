run this command to pull jenkins images from jenkins office
docker pull jenkins/jenkins
run this o build jenkins container.
docker run -v  /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -v /home/xuanlam/data_jenkins:/var/jenkins_home -p 8080:8080 --user 1000:999 --name jenkins_server -d jenkins/jenkins:lts

//
-v  /var/run/docker.sock:/var/run/docker.sock --> map volume docker from linux  to jenkins container
-v /usr/bin/docker:/usr/bin/docker --> map volume
-v /home/xuanlam/data_jenkins:/var/jenkins_home --> map volume to backup data_jenkins
-p 8080:8080  map port 8080 on local host  8080 jenkins container
may be add -p 50000:50000 for cluser jenkins_server (muliple jenkins_server)
--user 1000:999  --> use "id" on linux to see number of user and docker group
(defaul user 1000 and docker is 999)
-d do't show logs real time on screen
--name --> name of container
jenkins/jenkins:lts --> images using for this container.
//
after build success
open brower and type localhost:8080
see portal jenkins.
first-- must enter initialAdminPassword
back to console and type
docker exec -ti jenkins_server /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword
coppe text use see and pate to brower.
