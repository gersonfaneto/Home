if type -q zoxide
  zoxide init fish | source
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

if test -d "/opt/asdf-vm/bin"
  if not contains /opt/asdf-vm/bin $PATH
    export PATH="$PATH:/opt/asdf-vm/bin"
  end
  if type -q asdf
    source /opt/asdf-vm/asdf.fish
  end
end

if type -q bob
  if test -d "$HOME/.local/share/bob/nvim-bin"
    if not contains /home/gerson/.local/share/bob/nvim-bin $PATH
      export PATH="$PATH:/home/gerson/.local/share/bob/nvim-bin"
    end
  end
  if type -q nvim
    alias "v" "nvim"
    export MANROFFOPT='-c'
    export MANPAGER="nvim +Man!"
  end
end
