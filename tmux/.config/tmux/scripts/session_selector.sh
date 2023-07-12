#!/usr/bin/env fish

tmux list-sessions -F '#{?session_attached,,#{session_name}}' | sed '/^$/d' | fzf-tmux -p | xargs tmux switch-client -t
