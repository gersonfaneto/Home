alias sc "source $HOME/.config/fish/config.fish && echo 'Reloaded!'"

if type -q git
  alias g "git"
end

if type -q nvim
  alias v "nvim"
end

if type -q bat
  alias cat "bat"
end

if type -q trash
  alias rm "trash"
  alias rml "trash-list"
  alias rmr "trash-restore"
  alias rme "echo y | command trash-empty"
end

if type -q eza
  alias ls "eza --icons --color=always --group-directories-first"
  alias la "eza --all --icons --color=always --group-directories-first"
  alias ll "eza --icons --color=always --long --header --group-directories-first"
  alias lla "eza --all --long --icons --color=always --header --group-directories-first"
  alias tree "eza --all --tree --icons --color=always --group-directories-first"
end
