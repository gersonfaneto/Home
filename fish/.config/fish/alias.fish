if type -q exa
  alias ls "exa --icons --color=always --group-directories-first"
  alias la "exa --all --icons --color=always --group-directories-first"
  alias ll "exa --icons --color=always --long --header --group-directories-first"
  alias lla "exa --all --long --icons --color=always --header --group-directories-first"
  alias tree "exa --all --tree --icons --color=always --group-directories-first"
end

if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session"
  alias tn "tmux new-session -s (basename (pwd)) -d"
  alias tk "tmux kill-session"
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
end

if type -q kitty
  alias icat "kitty +kitten icat"
end
