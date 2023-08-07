function tmux_attach
  tmux list-sessions | sed 's/:.*$//' | fzf --prompt='Attach: ' | read line

  if test $line
    if test "$TMUX" = ''
      tmux attach-session -t $line
    else
      tmux switch-client -t $line
    end
  end

  commandline -f repaint
end
