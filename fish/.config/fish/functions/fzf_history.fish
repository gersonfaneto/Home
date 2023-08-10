function fzf_history
  history | fzf | read line

  if test $line
    commandline $line
    commandline -f execute
  else
    commandline ''
  end

  commandline -f repaint
end
