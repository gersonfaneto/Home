function fish_user_key_bindings
  fish_vi_key_bindings

  bind --mode insert \ef fzf_file
  bind --mode insert \ej fzf_directory
  bind --mode insert \ez fzf_zathura

  bind --mode insert \ec _atuin_search
  
  bind --mode insert \eb "btm"
  bind --mode insert \en "nvim"
  bind --mode insert \er "ranger && commandline -f repaint"

  bind --mode insert \ek tmux_kill
  bind --mode insert \ea tmux_attach
  bind --mode insert \es tmux_sessionizer
  
  bind --mode insert \cb "background && commandline -f repaint"
end
