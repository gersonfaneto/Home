if type -q bat
  export BAT_THEME="Tokyonight Storm"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
   --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
   --color=fg:#c0caf5,bg:-1,hl:#bb9af7 \
   --color=fg+:#ffffff,bg+:-1,hl+:#7dcfff \
   --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
   --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
end

export CURRENT_THEME="Tokyo-Night"
