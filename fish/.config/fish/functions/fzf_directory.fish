function fzf_directory
  zoxide query --list --score | awk '{print $2}' | fzf | read line

  if test $line
    cd $line
  end

  commandline -f repaint
end
