#--------------------------------------------------------------------------------#
#                               Basic Configs                                    #
#--------------------------------------------------------------------------------#

# Remove greetings from startup.
set fish_greeting ""

# Set default color support and editor.
set -gx TERM xterm-256color
set -gx EDITOR nvim

# General Aliases.
alias ex exit
alias cl clear
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
alias sr "sudo reboot -h now"
alias sp "sudo poweroff"
alias refresh "sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

#--------------------------------------------------------------------------------#
#                               Especial Aliases                                 #
#--------------------------------------------------------------------------------#

# Use 'exa' instead os 'ls'
if type -q exa
  alias ls "exa --icons"
  alias ll "exa --icons --long --header --group-directories-first"
  alias lla "exa --icons --long --all --header --group-directories-first"
  alias tree "exa --icons --tree --level=6 --only-dirs"
end

# Quickly manipulate TMUX sessions
if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session -t"
  alias tn "tmux new-session -s (basename (pwd))"
  alias tk "tmux kill-session -t"
end

# Quickly summon 'neofetch'
if type -q neofetch
  alias nf "neofetch"
end

# Quickly summon 'git' and use 'config' as an alias for the 'MySetup' repo.
if type -q git
  alias g git
  alias config "/usr/bin/git --git-dir=$HOME/Developer/GitHub/Personal/MySetup \
    --work-tree=$HOME/"
end

# Usa 'bat' as a substitute for 'cat'.
if type -q batcat
  alias bat "batcat --theme=TwoDark"
end

# Quickly summon neovim (Default editor)
if type -q nvim
  alias v nvim
end

#--------------------------------------------------------------------------------#
#                               Version Managers                                 #
#--------------------------------------------------------------------------------#

# 'Jabba': Manage Java versions and SDKs
if type -q jabba
  [ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"
end

# 'NVM': Manage Node (and it's utilities) versions
if type -q nvm
  set --universal nvm_default_version lts
end

#--------------------------------------------------------------------------------#
#                                 Path Updates                                   #
#--------------------------------------------------------------------------------#

# Add '~/.local/bin' to the $PATH
if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

# Add '~/.cargo/bin' to the $PATH (Requires Rust)
if test -d "$HOME/.cargo/bin/"
  export PATH="$PATH:$HOME/.cargo/bin"
end

# Add '~/.go/bin' to the $PATH (Requires Golang)
if test -d "$HOME/.go/bin/"
  export PATH="$PATH:$HOME/.go/bin"
end

#--------------------------------------------------------------------------------#
#                                 Common Tools                                   #
#--------------------------------------------------------------------------------#

# 'FZF': Fuzy file finder. Enable preview using 'batcat' and change default styling.
if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark --preview='bat \
  --theme=TwoDark --style=numbers --color=always --line-range :500 {}'"
end

# 'Batcat': Use it as the pager for 'man'.
if type -q batcat
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
end

# 'Starship': Prompt theme
if type -q starship
  starship init fish | source
end

#--------------------------------------------------------------------------------#
#                                  On Startup                                    #
#--------------------------------------------------------------------------------#

# Automatically create and/or attach to the 'Home' session on TMUX.
if status is-interactive  
  and not set -q TMUX
    if tmux has-session -t Home
      tmux attach-session -t Home
    else
      tmux new-session -s Home
    end
end

#--------------------------------------------------------------------------------#
#                                  Functions                                     #
#--------------------------------------------------------------------------------#

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

