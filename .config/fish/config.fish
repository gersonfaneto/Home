set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

alias ex exit
alias cl clear
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
alias sr "sudo reboot -h now"
alias sp "sudo poweroff"
alias refresh "sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

if type -q exa
  alias ls "exa --icons"
  alias ll "exa --icons --long --header --group-directories-first"
  alias lla "exa --icons --long --all --header --group-directories-first"
  alias tree "exa --icons --tree --level=6 --only-dirs"
end

if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session -t"
  alias tn "tmux new-session -s (basename (pwd))"
  alias tk "tmux kill-session -t"
end

if type -q neofetch
  alias nf "neofetch"
end

if type -q git
  alias g git
  alias config "/usr/bin/git --git-dir=$HOME/Developer/GitHub/Personal/MySetup --work-tree=$HOME/"
end

if type -q batcat
  alias bat "batcat --theme=TwoDark"
end

if type -q nvim
  alias v nvim
end

if type -q jabba
  [ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"
end

if type -q nvm
  set --universal nvm_default_version lts
end

if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

if test -d "$HOME/.cargo/bin/"
  export PATH="$PATH:$HOME/.cargo/bin"
end

if test -d "$HOME/go/bin/"
  export PATH="$PATH:$HOME/go/bin"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded --prompt='Search: ' \
  --info=inline --multi --tabstop=2 --color=dark --preview='bat --theme=TwoDark --style=numbers --color=always --line-range :500 {}'"
end

if type -q batcat
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
end

if type -q starship
  starship init fish | source
end

if status is-interactive  
  and not set -q TMUX
    if tmux has-session -t Home
      tmux attach-session -t Home
    else
      tmux new-session -s Home
    end
end

function hop -d "Create a new directory and set it as the CWD"
  command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
          case '-*'
          case '*'
            cd $argv[(count $argv)]
            return
        end
    end
end


