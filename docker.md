### To get the ip adress of a docker container
`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_of_db`

### removing docker image <use the -f flag for --force>
`docker rmi image:version`

### check docker system usage
`docker system df`

### getting rid of unused and images <also gets rid of stopped containers>
`docker system prune`

### accessing a docker container via the termainal 
`docker exec -it <container name> bash`

