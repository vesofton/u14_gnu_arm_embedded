#!/bin/bash -e

# Build and push Docker image to the Docker Hub.
#
# Author   : Henrico Brom
# Date     : 03-05-2019, 09:38
# Version  : 1.0

IMAGE_NAME=henbro12/u14_gnu_arm_embedded

createDockerImage() {
  if [ "$IS_GIT_TAG" = true ]; then
    echo "Starting Docker build for ${IMAGE_NAME}:release-${GIT_TAG_NAME} and ${IMAGE_NAME}:latest"
    sudo docker build -t $IMAGE_NAME:release-$GIT_TAG_NAME .
    sudo docker build -t $IMAGE_NAME:latest .
    echo "Completed Docker build for ${IMAGE_NAME}:${GIT_TAG_NAME}"
  elif [ "$BRANCH" = "develop" ]; then
    echo "Starting Docker build for ${IMAGE_NAME}:develop"
    sudo docker build -t $IMAGE_NAME:develop .
    echo "Completed Docker build for ${IMAGE_NAME}:develop"
  else
    echo "Starting Docker build for ${IMAGE_NAME}:master"
    sudo docker build -t $IMAGE_NAME:master .
    echo "Completed Docker build for ${IMAGE_NAME}:master"
  fi
}

dockerPush() {
  if [ "$IS_GIT_TAG" = true ]; then
    echo "Pushing tag ${IMAGE_NAME}:release-${GIT_TAG_NAME} and ${IMAGE_NAME}:latest"
    sudo docker push $IMAGE_NAME:release-$GIT_TAG_NAME
    sudo docker push $IMAGE_NAME:latest
    echo "Completed pushing tag ${IMAGE_NAME}:${GIT_TAG_NAME}"
  elif [ "$BRANCH" = "develop" ]; then
    echo "Pushing tag ${IMAGE_NAME}:develop"
    sudo docker push $IMAGE_NAME:develop
    echo "Completed pushing tag ${IMAGE_NAME}:develop"
  else
    echo "Pushing tag ${IMAGE_NAME}:master"
    sudo docker push $IMAGE_NAME:master
    echo "Completed pushing tag ${IMAGE_NAME}:master"
  fi
}

main() {
  createDockerImage
#  dockerPush
}

main
