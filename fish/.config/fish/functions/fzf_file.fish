function fzf_file
  set -l extra_flags --preview='bat --style=numbers --color=always --line-range :500 {}'

  rg --files --hidden --glob '!.git/*' --no-ignore | fzf $extra_flags | tr '\n' ' ' | read line

  if test $line
    commandline "$EDITOR $line"
    commandline -f execute
  end

  commandline -f repaint
end
