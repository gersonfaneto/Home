if type -q bat
  export BAT_THEME="Gruvbox Material - (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#654735,bg:-1,hl:#45707A \
  --color=fg+:#654735,bg+:-1,hl+:#45707A \
  --color=info:#A89984,prompt:#C14A4A,pointer:#654735\
  --color=marker:#654735,spinner:#C14A4A,header:#45707A"
end

export BACKGROUND="light"
export COLORSCHEME="Gruvbox-Material"
