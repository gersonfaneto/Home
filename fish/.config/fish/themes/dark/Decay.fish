if type -q bat
  export BAT_THEME="Decay-Green"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=fg:#b1ccc9,bg:-1,hl:#e88693 \
    --color=fg+:#b1ccc9,bg+:-1,hl+:#e88693 \
    --color=info:#af87ff,prompt:#af87ff,pointer:#e88693 \
    --color=marker:#ecd3a0,spinner:#ecd3a0,header:#ecd3a0"
end

export BACKGROUND="dark"
export COLORSCHEME="Decay"
