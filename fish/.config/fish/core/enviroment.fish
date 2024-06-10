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

if type -q mise
  mise activate fish | source
end

if type -q bob
  if test -d "$HOME/.local/share/bob/nvim-bin"
    if not contains /home/gerson/.local/share/bob/nvim-bin $PATH
      export PATH="$PATH:/home/gerson/.local/share/bob/nvim-bin"
    end
  end
  if type -q nvim
    alias "vim" "nvim"
    export MANROFFOPT='-c'
    export MANPAGER="nvim +Man!"
  end
end
