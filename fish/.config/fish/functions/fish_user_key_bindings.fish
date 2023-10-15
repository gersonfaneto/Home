function fish_user_key_bindings
  bind \ef fzf_file
  bind \er fzf_history
  bind \ej fzf_directory

  bind \el lf
  bind \eb btm
  bind \en nvim

  bind \ek tmux_kill
  bind \ea tmux_attach
  bind \es tmux_sessionizer
  
  bind \ct fzf_theme
  bind \cf font-selector

  bind \cl 'clear; commandline -f repaint; source ~/.config/fish/config.fish'

  bind ! history_previous_command
  bind '$' history_previous_command_arguments

  # fish_vi_key_bindings --no-erase insert
end
