if test -d "$HOME/.local/bin/"
  if not contains $HOME/.local/bin/ $PATH
    export PATH="$PATH:$HOME/.local/bin/"
  end
end

if test -d "$HOME/.local/scripts/"
  if not contains $HOME/.local/scripts/ $PATH
    export PATH="$PATH:$HOME/.local/scripts/"
  end
end

if test -d "$HOME/.local/share/nvim/mason/bin/"
  if not contains $HOME/.local/share/nvim/mason/bin/ $PATH
    export PATH="$PATH:$HOME/.local/share/nvim/mason/bin/"
  end
end

if test -d "/usr/local/lib/"
  if not contains /usr/local/lib $LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
  end
end

if type -q bat
  export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end
