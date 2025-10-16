function yay --description 'Wrapper: map -s to -S for yay (AUR helper)'
    set -l args
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
        # If this is an option cluster, upcase any 's' to 'S'
        if string match -qr '^-.' -- $a
            set a (string replace -r 's' 'S' -- $a)
        end
        set -a args $a
    end

    command yay $args
end
