if type -q bat
  export BAT_THEME="Tokyo-Night (Dark)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
  --color=fg:#C0CAF5,bg:-1,hl:#BB9AF7 \
  --color=fg+:#FFFFFF,bg+:-1,hl+:#7DCFFF \
  --color=info:#7AA2F7,prompt:#7DCFFF,pointer:#7DCFFF \
  --color=marker:#9ECE6A,spinner:#9ECE6A,header:#9ECE6A"
end

export BACKGROUND="dark"
export COLORSCHEME="Tokyo-Night"
