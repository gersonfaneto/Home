function bak --argument filename
  cp -r $filename $filename.bak
end

function hop
  command mkdir -p $argv 2>/dev/null
  if test $status = 0
    switch $argv[(count $argv)]
      case '-*'
      case '*'
        cd $argv[(count $argv)]
        return
    end
  else
    cd $argv
  end
end

function todo
  ls --oneline --no-icons | grep TODO.md | read line

  if test $line && type -q glow
    if type -q glow
      command glow $line
    else if type -q bat
      command bat $line
    else
      command cat $line
    end
  else if test -f ~/Desktop/TODO.md
    if type -q glow
      command glow ~/Desktop/TODO.md
    else if type -q bat
      command bat ~/Desktop/TODO.md
    else
      command cat ~/Desktop/TODO.md
    end
  else
    echo "No TODO.md found"
  end
end
