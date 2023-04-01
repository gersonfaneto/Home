function fish_user_key_bindings
  # 'FZF'
  bind \cj fzf_directory
  bind \cf fzf_file
  bind \cr fzf_history

  # 'TMUX' + 'FZF'
  bind \ca tmux_attach
  bind \ck tmux_kill

  # Bring bash's "!!" and "!$! to fish. Depends on the two functions above.
  bind ! history_previous_command
  bind '$' history_previous_command_arguments
end
