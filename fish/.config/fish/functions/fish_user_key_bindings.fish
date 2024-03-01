function fish_user_key_bindings
  bind \ef fzf_file
  bind \er fzf_history
  bind \ej fzf_directory
  bind \ez fzf_zathura
  
  bind \el "lf && commandline -f repaint"
  bind \eL "lfcd && commandline -f repaint"
  bind \eb btm
  bind \en nvim

  bind \ek tmux_kill
  bind \ea tmux_attach
  bind \es tmux_sessionizer
  
  bind \cf font-selector

  bind \cb background

  bind ! history_previous_command
  bind '$' history_previous_command_arguments
end
