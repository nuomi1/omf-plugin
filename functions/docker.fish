function dpulla -d "Update all non dangling images from a registry"
    docker images | awk '(NR > 1) && ($2 !~ /none/) {print $1":"$2}' | xargs -L1 docker pull
end

function drmia -d "Remove all dangling images"
    docker images | awk '(NR > 1) && ($2 ~ /none/) {print $3}' | xargs -L1 docker rmi
end
