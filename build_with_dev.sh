#!/bin/bash
# This file appends my dev environment to a file,
# assuming it is written FROM a debian/ubuntu image

DOCKERFILE=$1
LOCATION=$(pwd)

# Print out the start of it
cat $DOCKERFILE
cd /tmp

# Get buildpack
wget https://raw.githubusercontent.com/MilesCranmer/docker-cuda-buildpack/master/Dockerfile -o buildpack.Dockerfile

# Get dev environment
wget https://raw.githubusercontent.com/MilesCranmer/docker-dev/master/Dockerfile -o dev.Dockerfile

# Remove base images
tail -n +2 buildpack.Dockerfile
tail -n +2 dev.Dockerfile

# Print out the new file
cat /tmp/buildpack.Dockerfile
cat /tmp/dev.Dockerfile

# Clean up
rm -f /tmp/*Dockerfile
cd $LOCATION
