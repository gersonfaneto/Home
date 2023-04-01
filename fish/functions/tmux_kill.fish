# Uses 'fzf' to list 'tmux' active sessions and quickly
# kill and/or exit them.
function tmux_kill
  tmux has-session 2> /dev/null
  if test $status -eq 1
    return
  end

  tmux list-sessions | sed 's/:.*$//' | fzf | read line

  if test $line
    tmux kill-session -t $line
  end

  commandline -f repaint
end
