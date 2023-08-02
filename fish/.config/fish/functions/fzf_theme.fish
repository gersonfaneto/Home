function fzf_theme
  find -L $HOME/.config/fish/themes -type f -exec basename {} .fish \; | grep --invert-match 'theme' | sed 's/-/ /g' | fzf | read line

  set line (echo $line | sed 's/ /-/g')

  if test $line
    ln -sf $HOME/.config/fish/themes/$line.fish $HOME/.config/fish/theme.fish
    source $HOME/.config/fish/theme.fish

    ln -fs $HOME/.config/tmux/themes/$line.conf $HOME/.config/tmux/theme.conf
    tmux source $HOME/.config/tmux/theme.conf

    set sessions (tmux list-sessions -F "#S")

    for session in $sessions
      tmux send-keys -t $session "source $HOME/.config/fish/theme.fish" ENTER "clear" ENTER
    end

    ln -fs $HOME/.config/kitty/themes/$line.conf $HOME/.config/kitty/theme.conf
    killall -SIGUSR1 kitty
  end

  commandline -f repaint
end
