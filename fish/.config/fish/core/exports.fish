if test -d "$HOME/.local/bin/"
  if not contains $HOME/.local/bin/ $PATH
    export PATH="$PATH:$HOME/.local/bin/"
  end
end

if test -d "$HOME/.local/share/nvim/mason/bin/"
  if not contains $HOME/.local/share/nvim/mason/bin/ $PATH
    export PATH="$PATH:$HOME/.local/share/nvim/mason/bin/"
  end
end

if test -d "$HOME/.local/scripts/"
  if not contains $HOME/.local/scripts/ $PATH
    export PATH="$PATH:$HOME/.local/scripts/"
  end
end

if test -d "$HOME/.ghcup/bin/"
  if not contains $HOME/.ghcup/bin/ $PATH
    export PATH="$PATH:$HOME/.ghcup/bin/"
  end
end

if test -d "$HOME/.cabal/bin/"
  if not contains $HOME/.cabal/bin/ $PATH
    export PATH="$PATH:$HOME/.cabal/bin/"
  end
end

if test -d "$HOME/.cargo/bin/"
  if not contains $HOME/.cargo/bin/ $PATH
    export PATH="$PATH:$HOME/.cargo/bin/"
  end
end

if test -d "/usr/local/lib/"
  if not contains /usr/local/lib $LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
  end
end

if type -q nvim
  export MANROFFOPT='-c'
  export MANPAGER="nvim +Man!"
end

if type -q google-chrome-stable
  export CHROME_EXECUTABLE="google-chrome-stable"
end
