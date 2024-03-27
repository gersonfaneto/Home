abbr --add --position command "ex" "exit"
abbr --add --position command "cl" "clear"

abbr --add --position anywhere ".."  ".."
abbr --add --position anywhere "..." "../.."
abbr --add --position anywhere ".3"  "../../.."
abbr --add --position anywhere ".4"  "../../../.."
abbr --add --position anywhere ".5"  "../../../../.."

abbr --add --position anywhere "and" "&&"
abbr --add --position anywhere "or" "||"

abbr --add --position anywhere "E" "| xargs nvim -"
abbr --add --position anywhere "G" "| grep"

abbr --add --position command "sshv" "nvim oil-ssh://"

function last_history_item
  echo $history[1]
end

function last_command_argument
  echo $history[1] | awk '{print $NF}'
end

abbr --add "!!" --position anywhere --function last_history_item
abbr --add "!\$" --position anywhere --function last_command_argument

abbr --add --position anywhere "p1"  "ping 1.1.1.1"
abbr --add --position anywhere "p8"  "ping 8.8.8.8"
abbr --add --position anywhere "p9"  "ping 9.9.9.9"
abbr --add --position anywhere "p10" "ping 10.0.0.1"
