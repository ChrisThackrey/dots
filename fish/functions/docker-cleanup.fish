function docker_cleanup
    echo "Running docker cleanup script"

    set -l ls "ls"
    set -l ps "ps"
    set -l rm "rm"

    set -l IMAGES (docker images -a -q)
    set -l VOLUMES (docker volume ls -qf dangling=true)
    set -l CONTAINERS (docker ps -a -q)

    if test -n (echo $CONTAINERS)
        echo "Stopping all containers"
        docker stop (echo $CONTAINERS) # Stop all containers
        echo "Removing stopped containers"
        docker rm (echo $CONTAINERS) # Remove all stopped containers
    end

    if test -n (echo $IMAGES)
        echo "Removing all images"
        docker rmi (echo $IMAGES) # Remove all images
    end

    if test -n (echo $VOLUMES)
        echo "Removing all volumes"
        docker volume rm (echo $VOLUMES) # Remove all volumes
    end
end
