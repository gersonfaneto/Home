if type -q bat
  export BAT_THEME="Catppuccin (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#4C4F69,bg:-1,hl:#D20F39 \
  --color=fg+:#4C4F69,bg+:-1,hl+:#D20F39 \
  --color=info:#8839EF,prompt:#8839EF,pointer:#DC8A78\
  --color=marker:#DC8A78,spinner:#DC8A78,header:#D20F39"
end

export BACKGROUND="light"
export COLORSCHEME="Catppuccin"
