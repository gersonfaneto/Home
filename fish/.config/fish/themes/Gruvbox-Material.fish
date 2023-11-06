if type -q bat
  export BAT_THEME="Gruvbox-Material"
end

if type -q tmux
  ln -sf $HOME/.config/tmux/themes/Gruvbox-Material.conf $HOME/.config/tmux/theme.conf
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --border=rounded \
    --prompt='Search: ' --info=inline --multi --tabstop=2 --color=dark \
    --color=fg:#e2caa9,bg:-1,hl:#80aa9e \
    --color=fg+:#e2caa9,bg+:-1,hl+:#80aa9e \
    --color=info:#7c6f64,prompt:#f2594b,pointer:#e2cca9\
    --color=marker:#e2cca9,spinner:#f2594b,header:#80aa9e"
end

export COLORSCHEME="Gruvbox-Material"
