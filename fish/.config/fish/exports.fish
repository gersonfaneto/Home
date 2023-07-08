if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

if test -d "$HOME/.cargo/bin/"
  export PATH="$PATH:$HOME/.cargo/bin/"
end

if type -q bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end
