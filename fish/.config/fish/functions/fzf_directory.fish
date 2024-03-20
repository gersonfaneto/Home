function fzf_directory
  zoxide query --interactive | read line

  if test $line
    cd $line
  end

  commandline -f repaint
end
