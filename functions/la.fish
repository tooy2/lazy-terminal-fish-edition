function la --wraps eza --description 'list all with icons (uses eza if available)'
    if type -q eza
        eza --icons --long --all --header --git $argv
    else
        command ls -la $argv
    end
end
