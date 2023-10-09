function tmux_sessionizer
  set -l base_targets "$HOME/Developer/Projects"

  set -l all_directories "$HOME/Notes" "$HOME/Developer" "$HOME/Developer/Projects" "$HOME/Developer/Playground"
  set -l all_directories $all_directories (find $base_targets -mindepth 1 -maxdepth 2 -type d)

  set selected (echo $all_directories | tr ' ' '\n' | fzf )

  set is_attached (tmux list-sessions 2>/dev/null | grep attached | wc --lines)

  if test -z $selected
    commandline -f repaint
    return 0
  end

  set selected_name (basename $selected | tr . _)

  set is_session (tmux list-sessions 2>/dev/null | grep $selected_name | wc --lines)

  if test $is_session -eq 0
    tmux new-session -s $selected_name -c $selected &>>/dev/null
    commandline -f repaint
    return 0
  end

  if test $is_attached -eq 0
    tmux attach-session -t $selected_name &>>/dev/null
    commandline -f repaint
    return 0
  end
end
