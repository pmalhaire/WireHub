    #!/bin/sh
tmux new-session -d 'go run cmd/server/server.go'
tmux split-window -v 'docker run -it --cap-add NET_ADMIN wirehub/sandbox /bin/bash -c "$(cat ./two_nodes.sh)"'
tmux split-window -v "docker run -it --cap-add NET_ADMIN wirehub/sandbox /bin/bash -c 'ping -w 20 node_a'"
tmux split-window -v "docker run -it --cap-add NET_ADMIN wirehub/sandbox /bin/bash -c 'ping -w 20 node_b'"
tmux -2 attach-session -d
