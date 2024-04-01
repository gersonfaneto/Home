# System.
abbr --add --position anywhere ".."  ".."
abbr --add --position anywhere "..." "../.."
abbr --add --position anywhere ".3"  "../../.."
abbr --add --position anywhere ".4"  "../../../.."
abbr --add --position anywhere ".5"  "../../../../.."

abbr --add --position anywhere "and" "&&"
abbr --add --position anywhere "or" "||"

abbr --add --position anywhere "E" "| xargs nvim -"
abbr --add --position anywhere "G" "| grep"

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

abbr --add --position anywhere "p1" "ping 1.1.1.1"
abbr --add --position anywhere "p8" "ping 8.8.8.8"
abbr --add --position anywhere "p9" "ping 9.9.9.9"
abbr --add --position anywhere "p10" "ping 10.0.0.1"

abbr --add --position command "scl" "systemctl"
abbr --add --position command "sclss" "systemctl status"
abbr --add --position command "scle" "systemctl enable"
abbr --add --position command "sclen" "systemctl enable --now"
abbr --add --position command "scld" "systemctl disable"
abbr --add --position command "sclt" "systemctl stop"
abbr --add --position command "scls" "systemctl start"
abbr --add --position command "sclr" "systemctl restart"

# NeoVIM
abbr --add --position anywhere --set-cursor "sshv" "nvim oil-ssh://%"

# GitHub CLI
abbr --add --position anywhere "grl" "gh repo list"
abbr --add --position anywhere "grc" "gh repo clone"

# Pandoc
abbr --add --position anywhere "pd" "pandoc"
abbr --add --position anywhere --set-cursor "pdmp" "pandoc %.md --output File.pdf"
abbr --add --position anywhere --set-cursor "pdmh" "pandoc %.md --output File.html --standalone"

# Docker
abbr --add --position anywhere "dkp" "docker ps"
abbr --add --position anywhere "dkpa" "docker ps -a"
abbr --add --position anywhere "dkpaq" "docker ps -a -q"
abbr --add --position anywhere "dks" "docker start"
abbr --add --position anywhere "dkt" "docker stop"
abbr --add --position anywhere "dktt" "docker stop $(docker ps -q)"
abbr --add --position anywhere "dkk" "docker kill"
abbr --add --position anywhere "dkkk" "docker kill $(docker ps -q)"
abbr --add --position anywhere "dkrm" "docker rm"
abbr --add --position anywhere "dkri" "docker rmi"
abbr --add --position anywhere "dke" "docker exec -ti"
abbr --add --position anywhere "dkl" "docker logs -f"
abbr --add --position anywhere "dki" "docker images"
abbr --add --position anywhere "dkc" "docker-compose"
abbr --add --position anywhere "dkcu" "docker compose up --detach"
abbr --add --position anywhere "dkcuu" "docker compose up --detach --build"
abbr --add --position anywhere "dkcd" "docker compose down --volumes"
abbr --add --position anywhere "dkcdd" "docker compose down --volumes --rmi all"
abbr --add --position anywhere "dkclean" "docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi"
