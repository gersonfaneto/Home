if type -q bat
  export BAT_THEME="Everforest (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#5C6A72,bg:-1,hl:#35A77C \
  --color=fg+:#5C6A72,bg+:-1,hl+:#35A77C \
  --color=info:#A6B0A0,prompt:#F85552,pointer:#5C6A72\
  --color=marker:#5C6A72,spinner:#F85552,header:#35A77C"
end

export BACKGROUND="light"
export COLORSCHEME="Everforest"
