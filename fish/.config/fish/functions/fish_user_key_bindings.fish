function fish_user_key_bindings
  # 'FZF'
  bind \cj fzf_directory
  bind \cf fzf_file
  bind \cr fzf_history

  # 'TMUX' + 'FZF'
  bind \ea tmux_attach
  bind \ek tmux_kill

  # Brings bash's "!!" and "!$" to fish.
  bind ! history_previous_command
  bind '$' history_previous_command_arguments
end
