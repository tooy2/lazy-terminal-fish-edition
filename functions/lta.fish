function lta --wraps eza --description 'tree view (all) with icons (uses eza if available)'
    if type -q eza
        eza --icons --tree --level=2 --all $argv
    else
        command ls $argv
    end
end
