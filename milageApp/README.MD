
To build a new docker image for the app, please build the jar, and add it to this folder as: milage.jar
Then run the command:
```
docker build -t rolfkristensen/milage-rest:latest .
```

Optionally also add a versioned tag.


Install the image as a service (stack/swarm)
- Update the properties file: dbsecret.properties to match correct jdbc connection info
- Create a secret for the properties file: dbsecret.properties
- Run the command:
```
docker stack deploy -c stack.yml milage
```
The API is now available at your host on port 9001
```
curl http://localhost:9001/user
```

Intall the image as a normal container
- Create a new volume and add the apropriate dbsecret.properties file
- Run the command:
```
docker run -it -v db_secret:/conf -e APP_DB_PROPERTY_FILE_PATH=/conf/db_secret.properties rolfkristensen/milage-rest:latest 
```



