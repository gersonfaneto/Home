function hash --description 'Quickly manage your $PATH.'
    set -l usage "USAGE: "(status current-function)" [--show|--add PATH|--erase NUM]"
    set -l count (count $argv)

    if test "$count" != "2"; and test "$count" != "1"
        echo 1>&2 "$usage"
        return
    end

    if test "$argv[1]" = "--show"
        set -l p (echo $PATH[1..-1])
        set -l p_colon (echo "$p" | sed s'/\ \//:\//g; s/\ ~/:~/g; s/\ .:/:.:/g')
        echo "$p_colon"  | string split ":" | nl
    else if test "$argv[1]" = "--add"
        if not test -d "$argv[2]"
            echo 1>&2 "'$argv[2]' is an invalid folder."
            return
        end
        fish_add_path -maP "$argv[2]" /dev/null 2> /dev/null; or true
    else if test "$argv[1]" = "--erase"
        if test (count $PATH) -lt $argv[2]
            echo 1>&2 "'$argv[2]' is an invalid index."
            return
        end
        set --erase PATH[$argv[2]]
    else
        echo 1>&2 "$usage"
        return
    end
end
