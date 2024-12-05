### To get the ip adress of a docker container
`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_of_db`
