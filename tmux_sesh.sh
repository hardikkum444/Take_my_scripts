#!/bin/bash

tmux new-session -d -s lock_in

tmux rename-window -t lock_in:0 'musikcube'

tmux send-keys -t lock_in:0 'musikcube' C-m

tmux new-window -t lock_in:1 -n 'code'

tmux new-window -t lock_in:2 -n 'run'

tmux attach-session -t lock_in

