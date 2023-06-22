#!/bin/bash

# Set the container name or ID
CONTAINER_NAME_OR_ID="elk-setup"


# Run `docker-compose down -v` to stop and remove the container
docker-compose down -v

# Check if the container exists
if [ -n "$(docker ps -a -q -f name=$CONTAINER_NAME_OR_ID)" ]; then
    # Check if the container is stopped
    if [ -n "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME_OR_ID)" ]; then
        echo "Container '$CONTAINER_NAME_OR_ID' stopped and removed using 'docker-compose down -v'."

        # Delete the stopped container
        docker rm $CONTAINER_NAME_OR_ID
        echo "Container '$CONTAINER_NAME_OR_ID' deleted."
    else
        echo "Container '$CONTAINER_NAME_OR_ID' is not stopped."
    fi
else
    echo "Container '$CONTAINER_NAME_OR_ID' does not exist."
fi
