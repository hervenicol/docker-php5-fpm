#!/bin/bash

###################
# Run this script to build a Docker image from the git tree.
###################

#### Configuration ####
IMAGE_NAME="hervenicol/php5-fpm"
IMAGE_TAG="latest"
#### End configuration ####

docker build --force-rm=true -t "$IMAGE_NAME":"$IMAGE_TAG" .

