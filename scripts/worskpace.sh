#!/bin/bash

# Navigate to the project directory
workspace

# Check if tmux is running
if ! pgrep -x "tmux" > /dev/null; then
  tmux start-server
fi

# Check if the session already exists
SESSION_NAME="workspace"
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
  # Create a new tmux session with the first window
  tmux new-session -d -s $SESSION_NAME -n source
  tmux send-keys -t $SESSION_NAME "nvim" C-m
fi

# Attach to the tmux session
tmux attach -t $SESSION_NAME
