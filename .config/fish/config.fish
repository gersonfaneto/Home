if status is-interactive
    # Commands to run in interactive sessions can go here

    # HACK :: This needs to be here for some reason...
    type -q zoxide; and zoxide init fish | source
end
