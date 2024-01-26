set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

source "$HOME/.config/fish/extras/alias.fish"
source "$HOME/.config/fish/extras/exports.fish"
source "$HOME/.config/fish/extras/functions.fish"
source "$HOME/.config/fish/extras/enviroment.fish"

# NOTE: This file is not tracked by git, should be used for local/temporary settings.
if test -f "$HOME/.config/fish/extras/extras.fish"
  source "$HOME/.config/fish/extras/extras.fish"
end

# NOTE: This should generate the `colors.fish` on a fresh install.
if not test -f "$HOME/.config/fish/extras/colors.fish"
  background
end

source "$HOME/.config/fish/extras/colors.fish"
