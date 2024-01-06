function fzf_background
  switch $BACKGROUND
    case Dark
      set COLORS "Gruvbox Material - (Light)"
    case Light
      set COLORS "Gruvbox Material - (Dark)"
    case '*'
      echo "Something went very wrong..."
  end

  ln -sf "$HOME/.config/fish/colors/$COLORS.fish" "$HOME/.config/fish/colors/current.fish"
  source "$HOME/.config/fish/colors/current.fish"

  ln -fs "$HOME/.config/tmux/colors/$COLORS.conf" "$HOME/.config/tmux/colors/current.conf"
  tmux source "$HOME/.config/tmux/colors/current.conf"

  set sessions (tmux list-sessions -F '#S')

  for session in $sessions
    set windows (tmux list-windows -t $session -F '#I')
    for window in $windows
      set panes (tmux list-panes -t $session:$window -F '#P')
      for pane in $panes
        tmux send-keys -t $session:$window.$pane "source $HOME/.config/fish/colors/current.fish && clear" ENTER
      end
    end
  end

  ln -fs "$HOME/.config/kitty/colors/$COLORS.conf" "$HOME/.config/kitty/colors/current.conf"
  killall -SIGUSR1 kitty

  commandline -f repaint
end
