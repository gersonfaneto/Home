if type -q bat
  export BAT_THEME="Decay (Dark)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#B1CCC9,bg:-1,hl:#E88693 \
  --color=fg+:#B1CCC9,bg+:-1,hl+:#E88693 \
  --color=info:#AF87FF,prompt:#AF87FF,pointer:#E88693 \
  --color=marker:#ECD3A0,spinner:#ECD3A0,header:#ECD3A0"
end

export BACKGROUND="dark"
export COLORSCHEME="Decay"
