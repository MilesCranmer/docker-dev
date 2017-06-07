#!/bin/bash
# This file appends my dev environment to a file,
# assuming it is written FROM a debian/ubuntu image

# Quit if errors
set -e

DOCKERFILE=$1
LOCATION=$(pwd)

# Print out the start of it
cat $DOCKERFILE
cd /tmp

# Get buildpack
wget -q https://raw.githubusercontent.com/MilesCranmer/docker-cuda-buildpack/master/Dockerfile -O buildpack.Dockerfile

# Get dev environment
wget -q https://raw.githubusercontent.com/MilesCranmer/docker-dev/master/Dockerfile -O dev.Dockerfile

# Remove base images
tail -n +2 "buildpack.Dockerfile" > "buildpack.tmp" && mv "buildpack.tmp" "buildpack.Dockerfile"
tail -n +2 "dev.Dockerfile" > "dev.tmp" && mv "dev.tmp" "dev.Dockerfile"

# Print out the new file
cat buildpack.Dockerfile
cat dev.Dockerfile

# Clean up
rm -f /tmp/*Dockerfile >/dev/null 2>&1
cd $LOCATION
