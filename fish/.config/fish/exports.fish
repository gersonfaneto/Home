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

if test -d "$HOME/.cargo/bin/"
  if not contains $HOME/.cargo/bin/ $PATH
    export PATH="$PATH:$HOME/.cargo/bin/"
  end
end

if test -d "$HOME/.bun"
  if not contains $HOME/.bun/bin/ $PATH
    export PATH="$PATH:$HOME/.bun/bin/"
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

if type -q asdf
  set rust_vesion (asdf current rust 2>/dev/null | awk '{print $2}')

  if not test $rust_vesion
    return
  end

  if not contains $HOME/.asdf/installs/rust/$rust_vesion/bin/ $PATH
    export PATH="$PATH:$HOME/.asdf/installs/rust/$rust_vesion/bin/"
  end
end
