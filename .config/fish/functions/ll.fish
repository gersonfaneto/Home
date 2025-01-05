function ll --wraps 'ls --color=auto -l' --description 'Alias for ls -l -X --group-directories-first'
    ls -l -X --group-directories-first $argv
end
