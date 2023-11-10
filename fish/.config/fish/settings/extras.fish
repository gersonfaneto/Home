if type -q starship
  starship init fish | source
end

if type -q zoxide
  zoxide init fish | source
end

if type -q rtx
  rtx activate fish | source
end

if type -q opam
  eval $(opam env)
end
