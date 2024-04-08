#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <number of sessions>"
    exit 1
fi

n=$1

# Start the rest of the sessions
for ((i = 0; i < n - 1; i++)); do
    tmux new-session -d -s s$i 
    tmux send-key -t s$i "./rundb -nid$i" C-m
done

# Start the first session
tmux new-session -d -s s$((n-1)) 
tmux send-key -t s$((n-1)) "./runcl -nid$((n-1))" C-m

