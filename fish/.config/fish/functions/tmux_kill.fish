function tmux_kill
  set sessions (tmux list-sessions -F '#S' 2>/dev/null)

  echo $sessions | tr ' ' '\n' | fzf | read line

  if test $line
    tmux kill-session -t $line
  end

  commandline -f repaint
end
