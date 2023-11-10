if type -q bat
  export BAT_THEME="Rose-Pine (Light)"
end

if type -q fzf
  export FZF_DEFAULT_OPTS="--layout=reverse --height=51% --border=rounded \
  --prompt='Search: ' --info=inline --multi --tabstop=3 --color=dark \
	--color=fg:#797593,bg:-1,hl:#D7827E \
	--color=fg+:#575279,bg+:-1,hl+:#D7827E \
	--color=border:#DFDAD9,header:#286983,gutter:#FAF4ED \
	--color=spinner:#EA9D34,info:#56949F,separator:#DFDAD9 \
	--color=pointer:#907AA9,marker:#B4637A,prompt:#797593"
end

export BACKGROUND="light"
export COLORSCHEME="Rose-Pine"
