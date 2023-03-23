# Uses 'fzf' to quickly browse the command history
# and re-execute a previous command.
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
