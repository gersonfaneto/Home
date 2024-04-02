if type -q zoxide
  zoxide init fish | source
end

if type -q mise
  mise activate fish | source
end

if type -q opam
  eval $(opam env)
end

if type -q starship
  starship init fish | source
end

if type -q atuin
  export ATUIN_NOBIND="true"

  atuin init fish | source
end
