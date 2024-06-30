if type -q bat
  export BAT_THEME="Gruvbox Material - (Dark)"
end

if type -q btm
  alias "btm" "btm --color default"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#E2CAA9,bg:-1,hl:#80AA9E \
  --color=fg+:#E2CAA9,bg+:-1,hl+:#80AA9E \
  --color=info:#7C6F64,prompt:#F2594B,pointer:#E2CCA9\
  --color=marker:#E2CCA9,spinner:#F2594B,header:#80AA9E"
end

export BACKGROUND="Dark"
export COLORSCHEME="Gruvbox-Material"
