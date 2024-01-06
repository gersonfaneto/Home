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

source "$HOME/.config/fish/extras/colors.fish"

source "$HOME/.config/fish/extras/alias.fish"
source "$HOME/.config/fish/extras/exports.fish"
source "$HOME/.config/fish/extras/functions.fish"
source "$HOME/.config/fish/extras/enviroment.fish"

# NOTE: This file is not tracked by git, should be used for local/temporary settings.
if test -f "$HOME/.config/fish/extras/extras.fish"
  source "$HOME/.config/fish/extras/extras.fish"
end
