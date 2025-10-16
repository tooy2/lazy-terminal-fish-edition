function ls --wraps eza --description 'ls with icons, shows hidden (uses eza if available)'
    if type -q eza
        eza --icons -a $argv
    else
        command ls -A $argv
    end
end
