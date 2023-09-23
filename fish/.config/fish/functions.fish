function bak --argument filename
  cp -r $filename $filename.bak
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

function hop --argument new_directory
  mkdir -p $new_directory 2>/dev/null

  if test $new_directory
    cd $new_directory
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
