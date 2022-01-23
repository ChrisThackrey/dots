function __highlight
    set -l theme
    set -l base16
    if set -q highlight_theme
        set theme $highlight_theme
        if string match -qr "^base16/" $highlight_theme
            set base16 "--base16"
            set theme (string sub -s 8 $highlight_theme)
        end
    else
        set theme edit-vim-dark
    end

    command highlight -O xterm256 --style=$theme $base16 --force $argv 2> /dev/null
end
