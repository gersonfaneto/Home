function background
  switch $BACKGROUND
    case Dark
      set COLORS "Gruvbox Material - (Light)"
    case Light
      set COLORS "Gruvbox Material - (Dark)"
    case '*'
      set COLORS "Gruvbox Material - (Dark)"
  end

  ln -sf "$HOME/.config/fish/colors/$COLORS.fish" "$HOME/.config/fish/extras/colors.fish"
  source "$HOME/.config/fish/extras/colors.fish"

  ln -fs "$HOME/.config/tmux/colors/$COLORS.conf" "$HOME/.config/tmux/extras/colors.conf"
  tmux source "$HOME/.config/tmux/extras/colors.conf" 2> /dev/null

  ps -e | grep -q tmux

  if test $status -eq 0
    tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index}' |\
      xargs -I PANE tmux send-keys -t PANE 'source $HOME/.config/fish/config.fish && clear' Enter 2> /dev/null
  end

  cp -f "$HOME/.config/alacritty/colors/$COLORS.toml" "$HOME/.config/alacritty/colors/color.toml"

  commandline -f repaint
end
