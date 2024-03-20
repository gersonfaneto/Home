function tmux_kill
  tmux list-sessions -F '#S' 2>/dev/null | fzf | tr '\n' ' ' | read --list line

  set count (count $line)

  if test $count -gt 0
    for session in $line
      tmux kill-session -t $session
    end
  end

  commandline -f repaint
end
