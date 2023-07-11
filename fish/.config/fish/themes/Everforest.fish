if type -q bat
  export BAT_THEME="Everforest"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=fg:#d3c6aa,bg:-1,hl:#7fbbb3 \
    --color=fg+:#d3c6aa,bg+:-1,hl+:#7fbbb3 \
    --color=info:#7a8478,prompt:#e67e80,pointer:#d3c6aa\
    --color=marker:#d3c6aa,spinner:#e67380,header:#7fbbb3"
end

export CURRENT_THEME="Everforest"
