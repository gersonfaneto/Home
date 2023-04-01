# Uses 'fzf' and 'z' to quickly search and jump to recently
# visited directories.
function fzf_directory
  z -l | sort -rn | cut -c 12- | fzf | read line

  if test $line
    cd $line
  end

  commandline -f repaint
end
