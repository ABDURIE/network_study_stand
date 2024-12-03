docker compose up -d
docker ps

tmux new-session \; split-window -h \; split-window -h

docker logs -fn 1 backend1
docker logs -fn 1 backend2
docker logs -fn 1 backend3
