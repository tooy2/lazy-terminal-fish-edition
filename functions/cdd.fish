function cdd --description 'List numbered directories (including hidden) in the current directory'
    echo "Available directories:"
    set -l i 1
    for dir in .*/ */
        if test -d "$dir"
            set -l dir_name (string replace -r '/$' '' -- $dir)
            if test "$dir_name" = "." -o "$dir_name" = ".."
                continue
            end
            if type -q eza
                set -l listed (eza --icons -d "$dir_name")
                echo "$i. $listed"
            else
                echo "$i. $dir_name"
            end
            set i (math $i + 1)
        end
    end
    echo ""
    echo "Usage: cd <number> to change to that directory"
end

