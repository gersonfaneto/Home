if type -q starship
  starship init fish | source
end

if type -q zoxide
  zoxide init fish | source
end

if test -d "$HOME/.asdf"
  source $HOME/.asdf/asdf.fish
end

if type -q opam
  eval $(opam env)
end
