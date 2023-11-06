function fzf_background
  echo "Dark Light" | tr ' ' '\n' | fzf | read line

  if test $line
    set line (echo $line | tr '[:upper:]' '[:lower:]')

    export BACKGROUND="$line"
  end

  commandline -f repaint
end
