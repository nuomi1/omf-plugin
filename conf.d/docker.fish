function dpulla -d "Update all non dangling images from a registry"
    docker images --format '{{.Repository}}:{{.Tag}}' | grep -v '<none>' | sort | xargs -L1 docker pull
end

function drmia -d "Remove all dangling images"
    docker image prune -f
end
