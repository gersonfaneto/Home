abbr --add --position anywhere "fp" "fish --private"

abbr --add --position anywhere "cl" "clear"
abbr --add --position anywhere "ex" "exit"

abbr --add --position anywhere "and" "&&"
abbr --add --position anywhere "or" "||"

abbr --add --position anywhere ".."  ".."
abbr --add --position anywhere "..." "../.."
abbr --add --position anywhere ".3"  "../../.."
abbr --add --position anywhere ".4"  "../../../.."
abbr --add --position anywhere ".5"  "../../../../.."

function history_replace
  switch "$argv[1]"
    case '!!'
      echo -- $history[1]
      return 0
    case '!#'
      echo -- $history[1] | read -lat tokens
      echo -- $tokens[-1]
      return 0
  end
  return 1
end

abbr --add --position anywhere "!!" --function history_replace
abbr --add --position anywhere '!#' --function history_replace

abbr --add --position anywhere --set-cursor "sshv" "nvim oil-ssh://%"

abbr --add --position anywhere "grl" "gh repo list"
abbr --add --position anywhere "gre" "gh repo edit"
abbr --add --position anywhere "grc" "gh repo clone"
abbr --add --position anywhere "grv" "gh repo view --web"
abbr --add --position anywhere --set-cursor "grcs" "gh repo clone % -- --depth 1"

abbr --add --position anywhere "pd" "pandoc"
abbr --add --position anywhere --set-cursor "pdmp" "pandoc %.md --output File.pdf"
abbr --add --position anywhere --set-cursor "pdmh" "pandoc %.md --output File.html --standalone"
