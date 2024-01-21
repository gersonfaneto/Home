if type -q eza
  alias ls "eza --icons --color=always --group-directories-first"
  alias la "eza --all --icons --color=always --group-directories-first"
  alias ll "eza --icons --color=always --long --header --group-directories-first"
  alias lla "eza --all --long --icons --color=always --header --group-directories-first"
  alias tree "eza --all --tree --icons --color=always --group-directories-first"
end

if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session"
  alias tn "tmux new-session -s (basename (pwd)) -d"
  alias tk "tmux kill-session"
  alias tK "tmux kill-server"
end

if type -q neofetch
  alias nf "neofetch"
end

if type -q git
  alias g git
end

if type -q vim
  alias v vim
end

if type -q nvim
  alias nv nvim
end

if type -q trash
  alias rm trash
  alias rml trash-list
  alias rmr trash-restore
  alias rme "echo y | command trash-empty"
end

if type -q bat
  alias cat bat
end

if type -q kitty
  alias icat "kitty +kitten icat"
end
