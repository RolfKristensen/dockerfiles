#!/bin/bash
if [ -z "$1" ]; then
  echo "Please supply the version for milageapp"
else
  echo "==== Downloading latest artifact of milageserver:$1"
  v_getSuccess=$(mvn dependency:get -DgroupId=dk.lightsaber.milage -DartifactId=milageserver -Dversion=$1 -Dtransitive=false | grep "BUILD SUCCESS")
  if [ -z "$v_getSuccess" ]; then
    echo "ERROR: Artifact not found"
    exit 1
  fi
    echo "==== Copy artifact to local folder"

  mv -u milage.jar milage.jar.old
  v_copySuccess=$(mvn dependency:copy -Dartifact=dk.lightsaber.milage:milageserver:$1 -DoutputDirectory=./ | grep "BUILD SUCCESS")
  if [ -z "$v_copySuccess" ]; then
    echo "ERROR: Could not copy artifact"
    exit 2
  else
    mv milageserver-$1.jar milage.jar
    echo "==== Build docker image"
    docker build -t rolfkristensen/milage-rest-api:$1 .
    docker build -t rolfkristensen/milage-rest-api:latest .
  fi
fi
