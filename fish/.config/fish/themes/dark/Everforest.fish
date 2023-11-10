if type -q bat
  export BAT_THEME="Everforest (Dark)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#D3C6AA,bg:-1,hl:#7FBBB3 \
  --color=fg+:#D3C6AA,bg+:-1,hl+:#7FBBB3 \
  --color=info:#7A8478,prompt:#E67E80,pointer:#D3C6AA\
  --color=marker:#D3C6AA,spinner:#E67380,header:#7FBBB3"
end

export BACKGROUND="dark"
export COLORSCHEME="Everforest"
