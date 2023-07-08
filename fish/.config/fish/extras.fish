if type -q starship
  starship init fish | source
end

if type -q zoxide
  zoxide init fish | source
end

if status is-interactive  
  and not set -q TMUX
    if not tmux has-session -t Home 2>/dev/null
      tmux new-session -s Home -d 2>/dev/null
    end
end
