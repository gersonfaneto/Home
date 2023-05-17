function tmux_attach
  tmux has-session 2> /dev/null
  if test $status -eq 1
    return
  end

  tmux list-sessions | sed 's/:.*$//' | fzf | read line

  if test $line
    if test "$TMUX" = ""
      tmux attach-session -t $line
    else
      tmux switch-client -t $line
    end
  end

  commandline -f repaint
end
