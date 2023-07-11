function fzf_theme
  find $HOME/.config/fish/themes -type f -exec basename {} .fish \; | sed 's/-/ /g' | fzf | read line

  set line (echo $line | sed 's/ /-/g')

  if test $line
    ln -sf $HOME/.config/fish/themes/$line.fish $HOME/.config/fish/themes/theme.fish
    source $HOME/.config/fish/themes/theme.fish
  end


  if test -f $HOME/.config/tmux/theme.conf
    tmux source $HOME/.config/tmux/theme.conf
  end

  commandline -f repaint
end
