# custom scrip to start lock-in focus mode

#!/bin/bash
tmux new-session -d -s lock_in
tmux rename-window -t lock_in:0 'musikcube'
tmux send-keys -t lock_in:0 'musikcube' C-m
tmux new-window -t lock_in:1 -n 'code'
tmux new-window -t lock_in:2 -n 'run'
tmux attach-session -t lock_in

: '

->> tmux - Scrolling
<leader> -> <Ctrl>-b

## Copy mode
<Leader>-[ enters copy-mode
Move around with <arrowkey>
You can also use <Page_Up>/<Page_Down> keys
q to exit copy-mode

## Enabling the mouse/trackpad:
<Leader> ": set -g mouse on" enables scrolling with the mouse wheel

'

