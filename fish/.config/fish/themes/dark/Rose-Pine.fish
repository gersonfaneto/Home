if type -q bat
  export BAT_THEME="Rose-Pine"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=51% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=3 --color=dark \
    --color=fg:#909caa,bg:-1,hl:#ebbcba \
    --color=fg+:#e1def4,bg+:-1,hl+:#ebbcba \
    --color=border:#404d52,header:#31748f,gutter:#191724 \
    --color=spinner:#f7c177,info:#9ccfd8,separator:#403d52 \
    --color=pointer:#c5a7e7,marker:#eb6f92,prompt:#908caa"
end

export BACKGROUND="dark"
export COLORSCHEME="Rose-Pine"
