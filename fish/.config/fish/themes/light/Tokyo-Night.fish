if type -q bat
  export BAT_THEME="Tokyo-Night (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#6172B0,bg:-1,hl:#B15C00 \
  --color=fg+:#6172B0,bg+:-1,hl+:#B15C00 \
  --color=info:#007197,prompt:#007197,pointer:#B15C00 \
  --color=marker:#9854F1,spinner:#9854F1,header:#9854F1"
end

export BACKGROUND="light"
export COLORSCHEME="Tokyo-Night"
