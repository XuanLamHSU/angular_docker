## this is document for build and run jenkins on docker
## first [install_docker]
[requirement]
## git
## install docker engine
open console
Run `git clone https://github.com/docker/docker-install.git`
`cd docker-install `
`sudo bash install.sh`
`sudo usermode -aG docker "user"`
## loguot and relogin
## pull jenkin images from jenkins office
`docker pull jenkins/jenkins:lts`
## create folder for backup data from jenkins
`mkdir data_jenkins`
`cd data_jenkins`
`docker run -v  /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -v pwd:/var/jenkins_home -p 8080:8080 --user 1000:999 --name jenkins_server -d jenkins/jenkins:lts`
## description
-v  /var/run/docker.sock:/var/run/docker.sock --> map volume docker from linux  to jenkins container
-v /usr/bin/docker:/usr/bin/docker --> map volume
-v pwd:/var/jenkins_home --> map volume to backup data_jenkins
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
