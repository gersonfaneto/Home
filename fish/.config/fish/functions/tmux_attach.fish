function tmux_attach
  set sessions (tmux list-sessions -F '#S' 2>/dev/null)
  
  echo $sessions | tr ' ' '\n' | fzf | read line

  if test $line
    if test "$TMUX" = ''
      tmux attach-session -t $line
    else
      tmux switch-client -t $line
    end
  end

  commandline -f repaint
end
