function fish_user_key_bindings
  fish_vi_key_bindings

  bind --mode insert \ef fzf_file
  bind --mode insert \ej fzf_directory
  bind --mode insert \ez fzf_zathura

  bind --mode insert \er _atuin_search
  
  bind --mode insert \el "lf && commandline -f repaint"
  bind --mode insert \eL "lfcd && commandline -f repaint"

  bind --mode insert \en "nvim"
  bind --mode insert \eN "nvim ."

  bind --mode insert \eb "btm"

  bind --mode insert \ek tmux_kill
  bind --mode insert \ea tmux_attach
  bind --mode insert \es tmux_sessionizer
  
  bind --mode insert \cf fzf_fonts

  bind --mode insert \cb "background && commandline -f repaint"
end
