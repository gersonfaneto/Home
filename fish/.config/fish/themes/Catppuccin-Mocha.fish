if type -q bat
  set -gx BAT_THEME "Catppucin Mocha"
end

if type -q fzf
  set -gx FZF_DEFAULT_OPTS "--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
end

set -Ux CURRENT_THEME "Catppuccin-Mocha"
