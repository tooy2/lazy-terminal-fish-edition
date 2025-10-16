function ll --wraps eza --description 'long list with icons (uses eza if available)'
    if type -q eza
        eza --icons --long --header --git $argv
    else
        command ls -l $argv
    end
end
