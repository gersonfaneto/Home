if type -q bat
  export BAT_THEME="Catppuccin (Dark)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg+:#CDD6F4,bg+:-1,hl+:#F38BA8 \
  --color=fg:#CDD6F4,bg:-1,hl:#F38BA8 \
  --color=info:#CBA6F7,prompt:#CBA6F7,pointer:#F5E0DC \
  --color=marker:#F4E0DC,spinner:#F5E0DC,header:#F38BA8"
end

export BACKGROUND="dark"
export COLORSCHEME="Catppuccin"
