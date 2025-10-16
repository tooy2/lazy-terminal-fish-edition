function pacman --description 'Wrapper: map -s to -S and auto-sudo when installing'
    set -l args
    set -l need_sudo 0
    set -l after_ddash 0

    for a in $argv
        if test $after_ddash -eq 1
            set -a args $a
            continue
        end
        if test "$a" = "--"
            set -a args --
            set after_ddash 1
            continue
        end
        # If this is an option, upcase any "s" to "S" inside the short-options cluster
        if string match -qr '^-.' -- $a
            set a (string replace -r 's' 'S' -- $a)
            if string match -qr 'S' -- $a
                set need_sudo 1
            end
        end
        set -a args $a
    end

    if test $need_sudo -eq 1; and test (id -u) -ne 0
        command sudo pacman $args
    else
        command pacman $args
    end
end
