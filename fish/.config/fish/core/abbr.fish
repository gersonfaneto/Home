abbr --add --position command "sweep" "echo yes | history clear && atuin search --delete-it-all"

abbr --add --position command "fp" "fish --private"

abbr --add --position command "cl" "clear"
abbr --add --position command "ex" "exit"

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

abbr --add --position anywhere "Y" "| xclip -r -selection clipboard"

abbr --add --position command "p1" "ping 1.1.1.1"
abbr --add --position command "p8" "ping 8.8.8.8"
abbr --add --position command "p9" "ping 9.9.9.9"
abbr --add --position command "pl" "ping 10.0.0.1"

abbr --add --position command --set-cursor='@' now "date '+%H:%M:%S'@"
abbr --add --position command --set-cursor='@' today "date +'%d.%m.%Y'@"

abbr --add --position command --set-cursor "sshv" "nvim oil-ssh://%"

abbr --add --position command "grl" "gh repo list"
abbr --add --position command "gre" "gh repo edit"
abbr --add --position command "grc" "gh repo clone"
abbr --add --position command "grv" "gh repo view --web"
abbr --add --position command --set-cursor "grcs" "gh repo clone % -- --depth 1"

abbr --add --position command "pd" "pandoc"
abbr --add --position command --set-cursor "pdmp" "pandoc %.md --output File.pdf"
abbr --add --position command --set-cursor "pdmh" "pandoc %.md --output File.html --standalone"
