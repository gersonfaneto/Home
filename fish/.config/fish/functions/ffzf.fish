function ffzf --description "A custom wrapper around `fzf`." --argument-names "mode"
  switch $mode
    case f files
      set -l extra_flags --preview='bat --style=numbers --color=always --line-range :500 {}'

      rg --files --hidden --glob '!.git/*' --no-ignore 2>/dev/null | fzf $extra_flags | tr '\n' ' ' | read line

      if test $line
        commandline "$EDITOR $line"
        commandline -f execute
      end
    case d docs
      set -l LOCATIONS "$HOME/Alexandria" "$HOME/Documents" "$HOME/Downloads"

      set FILES (find $LOCATIONS -type f -name "*.pdf")

      set SELECTED (for file in $FILES; echo $file; end | fzf -m)

      if test -n "$SELECTED"
        for file in $SELECTED
          nohup zathura "$file" > /dev/null 2>&1 &
        end
      end
    case D directory
      zoxide query --interactive | read line

      if test $line
        cd $line
      end
    case '*'
      commandline -f repaint
      return 1
  end

  commandline -f repaint
end
