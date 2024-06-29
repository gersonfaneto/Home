function ttmux --description "A custom wrapper around `tmux`." --argument-names "mode"
  switch $mode
    case a attach
      set sessions (tmux list-sessions -F '#S' 2>/dev/null)

      echo $sessions | tr ' ' '\n' | fzf | read line

      if test $line
        if test "$TMUX" = ''
          tmux attach-session -t $line
        else
          tmux switch-client -t $line
        end
      end
    case k kill
      tmux list-sessions -F '#S' 2>/dev/null | fzf | tr '\n' ' ' | read --list line

      set count (count $line)

      if test $count -gt 0
        for session in $line
          tmux kill-session -t $session
        end
      end
    case n new
      set -l all_directories "$HOME/Notes" "$HOME/Developer"

      set -l deep_targets "$HOME/Developer/Projects"
      set -l base_targets "$HOME/Developer/Playground"

      set -l all_directories $all_directories "$HOME/Developer/Playground"
      set -l all_directories $all_directories (find $base_targets -mindepth 1 -maxdepth 1 -type d)

      set -l all_directories $all_directories "$HOME/Developer/Projects"
      set -l all_directories $all_directories (find $deep_targets -mindepth 1 -maxdepth 2 -type d)

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
        return 0
      end

      if test $is_attached -eq 0
        tmux attach-session -t $selected_name &>>/dev/null
        return 0
      end
    case '*'
      commandline -f repaint
      return 1
  end

  commandline -f repaint
end
