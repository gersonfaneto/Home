function bak --argument filename
  cp -r $filename $filename.bak
end

function hop
  mkdir -p $argv 2>/dev/null
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
  command ls | grep TODO.md | read line

  if test $line && type -q glow
    if type -q glow
      glow $line
    else if type -q bat
      bat $line
    else
      cat $line
    end
  else if test -f ~/Notes/TODO.md
    if type -q glow
      glow ~/Notes/TODO.md
    else if type -q bat
      bat ~/Notes/TODO.md
    else
      cat ~/Notes/TODO.md
    end
  else
    echo "No TODO.md file found!"
  end
end
