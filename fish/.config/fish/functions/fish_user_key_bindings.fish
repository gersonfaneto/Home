function fish_user_key_bindings
  fish_vi_key_bindings

  bind --mode insert \ca accept-autosuggestion

  bind --mode insert \ec _atuin_search

  bind --mode insert \ef "ffzf files"
  bind --mode insert \ej "ffzf directory"
  bind --mode insert \ez "ffzf docs"

  bind --mode insert \ek "ttmux kill"
  bind --mode insert \ea "ttmux attach"
  bind --mode insert \es "ttmux new"

  bind --mode insert \cb background
end
