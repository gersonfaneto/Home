if type -q bat
  set -gx BAT_THEME "Catppuccin Latte"
end

if type -q fzf
  set -gx FZF_DEFAULT_OPTS "--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=bg+:-1,bg:-1,spinner:#dc8a78,hl:#d20f39 \
    --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
    --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
end

set -Ux CURRENT_THEME "Catppuccin-Latte"
