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
