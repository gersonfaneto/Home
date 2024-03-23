abbr --add --position anywhere ".."  ".."
abbr --add --position anywhere "..." "../.."
abbr --add --position anywhere ".3"  "../../.."
abbr --add --position anywhere ".4"  "../../../.."
abbr --add --position anywhere ".5"  "../../../../.."

abbr --add --position anywhere and "&&"
abbr --add --position anywhere or "||"

abbr --add --position anywhere f "false"
abbr --add --position anywhere t "true"

abbr --add --position anywhere cl "clear"
abbr --add --position anywhere cl "exit"
abbr --add --position anywhere ds "disown"

abbr --add --position anywhere sr "sudo reboot -h now"
abbr --add --position anywhere sp "sudo poweroff"

abbr --add --position anywhere E "| xargs nvim -"

function last_history_item
  echo $history[1]
end

function last_command_argument
  echo $history[1] | awk '{print $NF}'
end

abbr --add "!!" --position anywhere --function last_history_item
abbr --add "!\$" --position anywhere --function last_command_argument
