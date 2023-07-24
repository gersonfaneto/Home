function fish_user_key_bindings
  bind \ej fzf_directory
  bind \ef fzf_file
  bind \er fzf_history
  bind \et fzf_theme
  bind \el lf

  bind \ea tmux_attach
  bind \ek tmux_kill

  bind ! history_previous_command
  bind '$' history_previous_command_arguments

  # fish_vi_key_bindings --no-erase insert
end
