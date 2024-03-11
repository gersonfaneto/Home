function fzf_zathura
  set -l LOCATIONS "$HOME/Alexandria" "$HOME/Documents" "$HOME/Downloads"

  set FILES (find $LOCATIONS -type f -name "*.pdf")

  set SELECTED (for file in $FILES; echo $file; end | fzf -m)

  if test -n "$SELECTED"
    for file in $SELECTED
      nohup zathura "$file" > /dev/null 2>&1 &
    end
  end

  commandline -f repaint
end
