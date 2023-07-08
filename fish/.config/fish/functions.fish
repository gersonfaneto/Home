function bak --argument filename
  cp $filename $filename.bak
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

function todo -d "Display the contents of a TODO.md file on the current directory."
  ls --oneline --no-icons | grep TODO.md | read line

  if test $line 
    and type -q glow
    command glow $line
  else if test -f ~/Desktop/TODO.md
    and type -q glow
    command glow ~/Desktop/TODO.md
  end
end
