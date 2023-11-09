if type -q bat
  export BAT_THEME="Decay (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#101419,bg:-1,hl:#BD3C42 \
  --color=fg+:#101419,bg+:-1,hl+:#BD3C42 \
  --color=info:#A86CD0,prompt:#A86CD0,pointer:#BD3C42 \
  --color=marker:#CEAC67,spinner:#CEAC67,header:#CEAC67"
end

export BACKGROUND="light"
export COLORSCHEME="Decay"
