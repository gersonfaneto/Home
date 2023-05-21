function fish_user_key_bindings
  bind \cj fzf_directory
  bind \cf fzf_file
  bind \cr fzf_history

  bind \ea tmux_attach
  bind \ek tmux_kill

  bind ! history_previous_command
  bind '$' history_previous_command_arguments

  # fish_vi_key_bindings --no-erase insert
end
