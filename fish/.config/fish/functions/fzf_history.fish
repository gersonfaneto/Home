function fzf_history
  history | fzf --prompt='Run: ' | read line

  if test $line
    commandline $line
    commandline -f execute
  else
    commandline ''
  end

  commandline -f repaint
end
