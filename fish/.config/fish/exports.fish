if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

if test -d "$HOME/.local/scripts/"
  export PATH="$PATH:$HOME/.local/scripts/"
end

if test -d "$HOME/.cargo/bin/"
  export PATH="$PATH:$HOME/.cargo/bin/"
end

if test -d "/usr/local/lib"
  export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
end

if test -f "$HOME/Licenses/LR-133011_License.dat"
  export LM_LICENSE_FILE="$HOME/Licenses/LR-133011_License.dat"
end

if type -q bat
  export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end
