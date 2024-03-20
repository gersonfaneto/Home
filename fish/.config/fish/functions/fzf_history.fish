function fzf_history
  history | fzf | read line

  if test $line
    commandline $line
  else
    commandline ''
  end

  commandline -f repaint
end
