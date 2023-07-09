# TODO: Change to Gruvbox Material: https://github.com/sainnhe/gruvbox-material 

if type -q bat
  set -Ux BAT_THEME "gruvbox-dark"
end

if type -q fzf
  set -Ux FZF_DEFAULT_OPTS "--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=fg:#e2caa9,bg:-1,hl:#80aa9e \
    --color=fg+:#e2caa9,bg+:-1,hl+:#80aa9e \
    --color=info:#7c6f64,prompt:#f2594b,pointer:#e2cca9\
    --color=marker:#e2cca9,spinner:#f2594b,header:#80aa9e"
end

set -Ux CURRENT_THEME "Gruvbox"
