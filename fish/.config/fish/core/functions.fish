function bak --argument path
  set path (basename $path 2>/dev/null)

  if not test $path
    echo "No path provided!"
    return
  end

  if test -f "$path".bak || test -d "$path".bak
    echo "Backup already exists!"
  else if test $path && test -f $path || test -d $path
    cp -r $path $path.bak
  else
    echo "File or directory does not exist!"
  end
end

function tn --argument session_name
  if type -q tmux
    if test $session_name
      tmux new-session -s $session_name -d
    else
      tmux new-session -s (basename (pwd)) -d
    end
  end
end

function hop --argument path
  mkdir -p $path 2>/dev/null

  if test $path
    cd $path
  else
    echo "Failed to create directory!"
  end
end

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

  ln -fs "$HOME/.config/kitty/colors/$COLORS.conf" "$HOME/.config/kitty/extras/colors.conf"
  killall -SIGUSR1 kitty
end