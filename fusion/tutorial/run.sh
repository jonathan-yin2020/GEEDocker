#!/bin/bash

xhost +

# Default values of arguments
ENTERYPOINT=0

# Loop through arguments and process them
# Taken from: https://pretzelhands.com/posts/command-line-flags
for arg in "$@"
do
    case $arg in
        --entrypoint)
        ENTERYPOINT=1
        shift # Remove
        ;;
    esac
done

if [ $ENTERYPOINT -eq 1 ]; then
	docker run --rm -it --entrypoint /bin/bash --net=host --env="DISPLAY" --privileged -v $HOME/.Xauthority:/root/.Xauthority:rw -v /gevol/fusion:/gevol/fusion -v /opt/google/share/tutorials/fusion:/opt/google/share/tutorials/fusion --name fusioncontainer fusiontutorial:v1
else
	docker run --rm --net=host --env="DISPLAY" --privileged -v $HOME/.Xauthority:/root/.Xauthority:rw -v /gevol/fusion:/gevol/fusion -v /opt/google/share/tutorials/fusion:/opt/google/share/tutorials/fusion --name fusioncontainer fusiontutorial:v1 &
fi
