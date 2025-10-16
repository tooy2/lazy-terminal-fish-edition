function lt --wraps eza --description 'tree view with icons (uses eza if available)'
    if type -q eza
        eza --icons --tree --level=2 $argv
    else
        command ls $argv
    end
end
