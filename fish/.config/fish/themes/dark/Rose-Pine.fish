if type -q bat
  export BAT_THEME="Rose-Pine (Dark)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=51% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=3 --color=dark \
  --color=fg:#909CAA,bg:-1,hl:#EBBCBA \
  --color=fg+:#E1DEF4,bg+:-1,hl+:#EBBCBA \
  --color=border:#404D52,header:#31748F,gutter:#191724 \
  --color=spinner:#F7C177,info:#9CCFD8,separator:#403D52 \
  --color=pointer:#C5A7E7,marker:#EB6F92,prompt:#908CAA"
end

export BACKGROUND="dark"
export COLORSCHEME="Rose-Pine"
