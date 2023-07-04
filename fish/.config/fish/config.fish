set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

alias ex exit
alias cl clear
alias sr "sudo reboot -h now"
alias sp "sudo poweroff"
alias sweep "echo yes | history clear > /dev/null"
alias rs reset
alias sc "source $HOME/.config/fish/config.fish && echo 'Reloaded!'"

alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

alias ..  "cd .."
alias ... "cd ../.."
alias .3  "cd ../../.."
alias .4  "cd ../../../.."
alias .5  "cd ../../../../.."

if type -q exa
  alias ls "exa --icons --color=always --group-directories-first"
  alias la "exa --all --icons --color=always --group-directories-first"
  alias ll "exa --icons --color=always --long --header --group-directories-first"
  alias lla "exa --all --long --icons --color=always --header --group-directories-first"
  alias tree "exa --all --tree --icons --color=always --group-directories-first"
end

if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session"
  alias tn "tmux new-session -s (basename (pwd)) -d"
  alias tk "tmux kill-session"
end

if type -q neofetch
  alias nf "neofetch"
end

if type -q bat
  # Catppuccin
  # export BAT_THEME="Catppuccin-mocha"

  # Gruvbox
  # export BAT_THEME="gruvbox-dark"
end

if type -q git
  alias g git
end

if type -q vim
  alias v vim
end

if type -q nvim
  alias nv nvim
end

if type -q trash
  alias rm trash
end

if type -q python
  alias py python
else
  alias py python3
end

if test -d ~/.asdf
  source ~/.asdf/asdf.fish
end

if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

if test -d "$HOME/.cargo/bin/"
  export PATH="$PATH:$HOME/.cargo/bin/"
end

if asdf where golang > /dev/null 2>&1
  export PATH="$PATH:$(asdf where golang)/packages/bin"
end

if asdf where rust > /dev/null 2>&1
  export PATH="$PATH:$(asdf where rust)/bin"
end

if test -d "$HOME/.dotnet/tools"
  export PATH="$PATH:$HOME/.dotnet/tools"
end

if type -q fzf
  # Rose Pine
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
	--color=fg:#908caa,bg:-1,hl:#ebbcba
	--color=fg+:#e0def4,bg+:-1,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

  # Catppuccin
  # export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  # --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  # --color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
  # --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  # --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

  # Gruvbox
  # export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  # --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  # --color=fg:#e2caa9,bg:-1,hl:#80aa9e \
  # --color=fg+:#e2caa9,bg+:-1,hl+:#80aa9e \
  # --color=info:#7c6f64,prompt:#f2594b,pointer:#e2cca9\
  # --color=marker:#e2cca9,spinner:#f2594b,header:#80aa9e"
end

if type -q bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end

if type -q starship
  starship init fish | source
end

if type -q zoxide
  zoxide init fish | source
end

if status is-interactive  
  and not set -q TMUX
    if not tmux has-session -t Home 2>/dev/null
      tmux new-session -s Home -d 2>/dev/null
    end
end

function hop -d "Create a new directory and sets the CWD to it."
  command mkdir -p $argv 2>/dev/null
    if test $status = 0
        switch $argv[(count $argv)]
          case '-*'
          case '*'
            cd $argv[(count $argv)]
            return
        end
      else
        cd $argv
    end
end


function bak --argument filename -d "Function for creating a backup for a given file."
    cp $filename $filename.bak
end

function todo -d "Display the contents of a TODO.md file on the current directory."
  ls --oneline --no-icons | grep TODO.md | read line

  if test $line 
    and type -q glow
    command glow $line
  else if test -f ~/Desktop/TODO.md
    and type -q glow
    command glow ~/Desktop/TODO.md
  end
end

