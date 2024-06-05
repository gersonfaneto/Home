# Abbreviations #

abbr --add --position command "fp" "fish --private"

abbr --add --position command "sc" "source $HOME/.config/fish/config.fish"

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

abbr --add --position command --set-cursor='@' now "date '+%H:%M:%S'@"
abbr --add --position command --set-cursor='@' today "date +'%d.%m.%Y'@"

abbr --add --position command --set-cursor "sshv" "nvim oil-ssh://%/"

abbr --add --position command "grl" "gh repo list"
abbr --add --position command "gre" "gh repo edit"
abbr --add --position command "grc" "gh repo clone"
abbr --add --position command "grv" "gh repo view --web"
abbr --add --position command --set-cursor='@' "grcs" "gh repo clone @ -- --depth 1"

abbr --add --position command "tx" "tmux"
abbr --add --position command "txl" "tmux list-sessions"
abbr --add --position command "txs" "tmux switch-client -t"
abbr --add --position command "txa" "tmux attach-session"
abbr --add --position command "txn" "tmux new-session -d -s (basename (pwd))"
abbr --add --position command "txk" "tmux kill-session"
abbr --add --position command "txK" "tmux kill-server"

abbr --add --position command "pd" "pandoc"
abbr --add --position command --set-cursor='@' "pdmp" "pandoc @.md --output File.pdf"
abbr --add --position command --set-cursor='@' "pdmh" "pandoc @.md --output File.html --standalone"

# Aliases #

if type -q z
  alias "cd" "z"
  alias "ci" "zi"
end

if type -q git
  alias "g" "git"
end

if type -q bat
  alias "cat" "bat"
end

if type -q trash
  alias "rm" "trash"
  alias "rml" "trash-list"
  alias "rmr" "trash-restore"
  alias "rme" "echo y | command trash-empty"
end

if type -q eza
  alias "ls" "eza --icons --color=always --oneline --group-directories-first"
  alias "la" "eza --all --icons --color=always --oneline --group-directories-first"
  alias "ll" "eza --icons --color=always --long --header --group-directories-first"
  alias "lla" "eza --all --long --icons --color=always --header --group-directories-first"
  alias "t" "eza --all --tree --icons --color=always --group-directories-first"
end
