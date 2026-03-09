#!/bin/bash

tmux rename-window "editor"
tmux send-keys "nvim +'lua Snacks.picker.files()'" C-m

tmux new-window -n "terminal"

tmux split-window -h 

tmux select-window -t 1


