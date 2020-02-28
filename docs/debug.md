# Debugging

## Things to Check

* RAM utilization -- polisd is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The polis blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 2GB+ is necessary.

## Viewing polisd Logs

    docker logs polisd-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the polisd node, but will not connect to already running containers or processes.

    docker run -v polisd-data:/polis --rm -it polispay/polisd bash -l

You can also attach bash into running container to debug running polisd

    docker exec -it polisd-node bash -l


