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

function ix --argument file
  if not test $file
    echo "No file provided!"
    return
  else if not test -f $file
    echo "File does not exist!"
    return
  else
    curl -F "f:1=@$file" ix.io
  end
end

function todo
  command ls | grep TODO.md | read line

  if test $line
    set todo $line
  else if test -f ~/Notes/TODO.md
    set todo ~/Notes/TODO.md
  else
    echo "No TODO.md file found!"
    return
  end

  if type -q glow
    glow $todo
  else if type -q bat
    bat $todo
  else
    cat $todo
  end
end

function etodo
  command ls | grep TODO.md | read line

  if test $line
    $EDITOR $line
  else if test -f ~/Notes/TODO.md
    $EDITOR ~/Notes/TODO.md
  else
    echo "No TODO.md file found!"
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
  tmux source "$HOME/.config/tmux/extras/colors.conf"

  set sessions (tmux list-sessions -F '#S')

  for session in $sessions
    set windows (tmux list-windows -t $session -F '#I')
    for window in $windows
      set panes (tmux list-panes -t $session:$window -F '#P')
      for pane in $panes
        tmux send-keys -t $session:$window.$pane "source $HOME/.config/fish/extras/colors.fish && clear" ENTER
      end
    end
  end

  ln -fs "$HOME/.config/kitty/colors/$COLORS.conf" "$HOME/.config/kitty/extras/colors.conf"
  killall -SIGUSR1 kitty

  commandline -f repaint
end
