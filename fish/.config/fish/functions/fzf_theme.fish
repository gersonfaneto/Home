function fzf_theme
  find -L $HOME/.config/fish/themes -type f -exec basename {} .fish \; | grep --invert-match 'theme' | sed 's/-/ /g' | fzf | read line

  set line (echo $line | sed 's/ /-/g')

  if test $line
    ln -sf $HOME/.config/fish/themes/$line.fish $HOME/.config/fish/themes/theme.fish
    source $HOME/.config/fish/themes/theme.fish

    ln -fs $HOME/.config/kitty/themes/$line.conf $HOME/.config/kitty/themes/theme.conf
    killall -SIGUSR1 kitty
  end

  if test -f $HOME/.config/tmux/theme.conf
    tmux source $HOME/.config/tmux/theme.conf
  end

  commandline -f repaint
end
