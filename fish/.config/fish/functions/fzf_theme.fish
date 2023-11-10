function fzf_theme
  set colorschemes (find $HOME/.config/fish/themes/$BACKGROUND -type f -exec basename {} .fish \;)

  set colorschemes (echo $colorschemes |  tr ' ' '\n' | sed 's/-/ /g' | sort | fzf | read line)

  set colorscheme (echo $line | sed 's/ /-/g')

  if test $colorscheme
    colorizer $colorscheme $BACKGROUND
  end

  commandline -f repaint
end
