
Build image

    docker build --tag=devbox .

Stop and remove running container

    docker stop devbox
    docker rm devbox

Run `devbox` container

    docker run -it -d -h host --name devbox devbox

Run shell as user

    docker exec -it --user=user devbox zsh
