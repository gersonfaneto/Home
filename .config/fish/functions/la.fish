function la --wraps 'ls' --description 'Alias for ls -A'
    command ls --almost-all --color=auto $argv
end
