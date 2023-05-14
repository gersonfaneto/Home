#--------------------------------------------------------------------------------#
#                               Basic Configs                                    #
#--------------------------------------------------------------------------------#

# Remove the default 'fish' greeting.
set fish_greeting ""

# Set default color support and editor.
set -gx TERM xterm-256color
set -gx EDITOR nvim

#--------------------------------------------------------------------------------#
#                               Basic Aliases                                    #
#--------------------------------------------------------------------------------#

# General Aliases.
alias ex exit
alias cl clear
alias sr "sudo reboot -h now"
alias sp "sudo poweroff"
alias sweep "echo yes | history clear > /dev/null"
alias rs reset

# Confirm before overwriting something.
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

# Navigation.
alias ..  "cd .."
alias ... "cd ../.."
alias .3  "cd ../../.."
alias .4  "cd ../../../.."
alias .5  "cd ../../../../.."

#--------------------------------------------------------------------------------#
#                               Especial Aliases                                 #
#--------------------------------------------------------------------------------#

# Use 'exa' instead of 'ls'.
if type -q exa
  alias ls "exa --icons --color=always --group-directories-first"
  alias la "exa --all --icons --color=always --group-directories-first"
  alias ll "exa --icons --color=always --long --header --group-directories-first"
  alias lla "exa --all --long --icons --color=always --header --group-directories-first"
  alias tree "exa --all --tree --icons --color=always --group-directories-first"
end

# Quickly manipulate 'TMUX' sessions.
if type -q tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session"
  alias tn "tmux new-session -s (basename (pwd)) -d"
  alias tk "tmux kill-session"
end

# Quickly summon 'neofetch'.
if type -q neofetch
  alias nf "neofetch"
end

# Use 'bat' as a substitute for 'cat'.
if type -q bat
  alias bat "bat --theme=TwoDark"
end

# Quickly summon 'git'.
if type -q git
  alias g git
end

# Quickly summon 'vim'.
if type -q vim
  alias v vim
end

# Quickly summon 'neovim' (Default editor).
if type -q nvim
  alias nv nvim
end

# Use 'trash' instead of default 'rm' command.
if type -q trash
  alias rm trash
end

# Quickly summon 'Python' interpreter.
if type -q python
  alias py python
else
  alias py python3
end

#--------------------------------------------------------------------------------#
#                               Version Manager                                  #
#--------------------------------------------------------------------------------#

# 'ASDF': Multiple runtime and language version manager.
if test -d ~/.asdf
  source ~/.asdf/asdf.fish
end

#--------------------------------------------------------------------------------#
#                                 Path Updates                                   #
#--------------------------------------------------------------------------------#

# Add '~/.local/bin' to the $PATH.
if test -d "$HOME/.local/bin/"
  export PATH="$PATH:$HOME/.local/bin/"
end

# Add 'Go' binaries to the $PATH.
if asdf where golang > /dev/null 2>&1
  export PATH="$PATH:$(asdf where golang)/packages/bin"
end

# Add 'Rust' binaries to the $PATH.
if asdf where rust > /dev/null 2>&1
  export PATH="$PATH:$(asdf where rust)/bin"
end

# Add 'Dotnet' binaries to the $PATH.
if test -d "$HOME/.dotnet/tools"
  export PATH="$PATH:$HOME/.dotnet/tools"
end

#--------------------------------------------------------------------------------#
#                                 Common Tools                                   #
#--------------------------------------------------------------------------------#

# 'FZF': Fuzzy file finder. Enable preview using 'bat' and change default styling.
if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark"
end

# 'Bat': Use it as the pager for 'man'.
if type -q bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end

# 'Starship': Prompt theme.
if type -q starship
  starship init fish | source
end

#--------------------------------------------------------------------------------#
#                                  On Startup                                    #
#--------------------------------------------------------------------------------#

# Automatically create the 'Home' session on 'TMUX'.
if status is-interactive  
  and not set -q TMUX
    if not tmux has-session -t Home 2>/dev/null
      tmux new-session -s Home -d 2>/dev/null
    end
end

#--------------------------------------------------------------------------------#
#                                  Functions                                     #
#--------------------------------------------------------------------------------#

# Function for creating a new directory and changing into at the same time.
# Ex: hop Foo
# Output: Creates a new folder called Foo and 'cd' into it.
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


# Function for creating a backup for a given file.
# Ex: bak Foo.txt
# Output: Copies file as Foo.txt.bak.
function bak --argument filename -d "Function for creating a backup for a given file."
    cp $filename $filename.bak
end


# Function for displaying the contents of a TOOD.md file on the current working.
# directory. If no file is found, looks for one in the ~/Desktop.
# Ex: todo 
# Output: Display the contents of the found TODO.md using 'glow'.
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

