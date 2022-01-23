function colors
    set option $argv[1]
    switch "$option"
        case '--examples'
            colors::examples
        case '--variables'
            colors::variables
        case '--ansi'
            colors::ansi
        case '--aixterm'
            colors::aixterm
        case '--256colors'
            colors::256-colors
        case '--help'
            echo 'Usage: colors [option]'
            echo
            echo 'Available Options:'
            echo '  --help        Show this help'
            echo '  --examples    Display fish syntax highlighting examples'
            echo '  --variables   Display fish syntax highlighting variables'
            echo '  --ansi        Display ANSI colors table (default option)'
            echo '  --aixterm     Display aixterm high intensity colors table'
            echo '  --256colors  Display 256 colors table'
        case ''
            colors::ansi
        case '*'
            echo "colors: invalid option $option"
    end
end

function colors::ansi
    set text 'gYw'

    echo
    echo -e -n "\e[1mANSI Standard Colors\e[0m :\n"
    echo -e -n "  foreground: ESC[{\e[38;5;196m30-37\e[0m}m, bright foreground: ESC[1;{\e[38;5;196m30-37\e[0m}m\n"
    echo -e -n "  background: ESC[{\e[38;5;196m40-47\e[0m}m\n"

    echo -e -n "\n     "
    for BG in '   ' '40m' '41m' '42m' '43m' '44m' '45m' '46m' '47m'
        printf "   $BG  "
    end
    echo

    set foregrounds 'm' '1m' '30m' '1;30m' '31m' '1;31m' '32m' '1;32m' '33m' '1;33m' '34m' '1;34m' '35m' '1;35m' '36m' '1;36m' '37m' '1;37m'

    for i in (seq (count $foregrounds))
        set FG  $foregrounds[$i]
        printf " %5s \e[$FG  $text " $FG
        for BG in '40m' '41m' '42m' '43m' '44m' '45m' '46m' '47m';
            printf " \e[$FG\e[$BG  $text  \e[0m";
        end
        echo
    end
    echo
end

function colors::256-colors

    echo
    echo -e -n "\e[1m256 Colors\e0m :\n"
    echo -e -n "  foreground: ESC[38;5;{\e[38;5;196m0-255\e[0m}m\n"
    echo -e -n "  background: ESC[48;5;{\e[38;5;196m0-255\e[0m}m\n"

    echo
    echo -e " \e[1mStandard Colors\e[0m :"
    for c in (seq 0 15)
        set bg (printf "48;5;%dm" $c)
        printf " \e[%s %3s \e[0m" $bg $c
        [ "$c" = '7' ]; and echo
    end
    echo

    echo
    echo -e " \e[1m216 Colors\e[0m :"
    for v in (seq 16 12 231)
        for h in (seq $v 1 231)[1..12]
            set bg (printf "48;5;%dm" $h)
            printf " \e[%s %3s \e[0m" $bg $h
        end
        echo
    end
    echo

    echo -e " \e[1mGrayscale Colors\e[0m :"
    for c in (seq 232 255)
        set bg (printf "48;5;%dm" $c)
        printf " \e[%s %3s \e[0m" $bg $c
        [ "$c" = '243' ]; and echo
    end
    echo -e "\n"
end

function colors::aixterm
    set text 'gYw'

    echo
    echo -e -n "\e[1mHigh Intensity Colors (aixterm)\e[0m :\n"
    echo -e -n "  foreground: ESC[{\e[38;5;196m90-97\e[0m}m\n"
    echo -e -n "  background: ESC[{\e[38;5;196m100-107\e[0m}m\n"

    echo -e -n "\n     "
    for BG in '    ' '100m' '101m' '102m' '103m' '104m' '105m' '106m' '107m'
        printf "  $BG  "
    end
    echo

    set foregrounds '90m' '91m' '92m' '93m' '94m' '95m' '96m' '97m'

    for i in (seq (count $foregrounds))
        set FG  $foregrounds[$i]
        printf " %5s \e[$FG  $text " $FG
        for BG in '100m' '101m' '102m' '103m' '104m' '105m' '106m' '107m';
            printf " \e[$FG\e[$BG  $text  \e[0m";
        end
        echo
    end
    echo
end

function colors::examples

    set -l desc_color "yellow --bold"

    function __dummy_prompt
        __printc "$fish_color_cwd" "/h/foo"
        __printc normal "> "
    end

    function __clear_newline
        set_color -b normal; printf "\n"
    end

    __printc "$desc_color" "\nValid commmand\n"
    __dummy_prompt
    __printc "$fish_color_command" "command"
    __clear_newline

    __printc "$desc_color" "\nInvalid commmand\n"
    __dummy_prompt
    __printc "$fish_color_error" "comaand"
    __clear_newline

    __printc "$desc_color" "\nParameters (normal, valid path)\n"
    __dummy_prompt
    __printc "$fish_color_command" "git"
    __printc "normal" " "
    __printc "$fish_color_param" "add"
    __printc "normal" " "
    set_color $fish_color_param; set_color $fish_color_valid_path; printf "spec/"
    __clear_newline

    __printc "$desc_color" "\nParameters (quote)\n"
    __dummy_prompt
    __printc "$fish_color_command" "printf"
    __printc "normal" " "
    __printc "$fish_color_quote" "\"%%s\\\n\""
    __clear_newline

    __printc "$desc_color" "\nAutosuggestion\n"
    __dummy_prompt
    __printc "$fish_color_command" "curl"
    __printc "normal" " "
    __printc "$fish_color_autosuggestion" "http://www.google.com/"
    __clear_newline

    __printc "$desc_color" "\nCompletions\n"
    __dummy_prompt
    __printc "$fish_color_command" "fish\n"
    __printc "$fish_pager_color_prefix" "fish"
    __printc "normal" "                               "
    __printc "$fish_pager_color_description" "(Executable link, 901kB)"
    __clear_newline
    __printc "$fish_pager_color_prefix" "fish"
    __printc "$fish_pager_color_completion" "_config"
    __clear_newline
    set_color $fish_color_search_match; set_color --bold white
    printf "fish"
    __printc "$fish_color_search_match" "_default_key_bindings"
    __printc "$fish_color_search_match" "     "
    set_color $fish_color_search_match $fish_pager_color_description
    printf "(Default (Emacs-like) key b…)"
    __clear_newline
    __printc "$fish_pager_color_progress" "…and 16 more rows"
    __clear_newline

    __printc "$desc_color" "\nComments\n"
    __dummy_prompt
    __printc "$fish_color_command" "say"
    __printc "normal" " "
    __printc "$fish_color_param" "hello"
    __printc "normal" " "
    __printc "$fish_color_comment" "# Your Mac will speak"
    __clear_newline

    __printc "$desc_color" "\nOperators (like '*' and '~'), Separators (like ';' and '&')\n"
    __dummy_prompt
    __printc "$fish_color_command" "mv"
    __printc "normal" " "
    __printc "$fish_color_param" "foo/"
    __printc "$fish_color_operator" "*"
    __printc "normal" " "
    set_color $fish_color_param; set_color $fish_color_valid_path; printf "bar/"
    __printc "$fish_color_end" ";"
    __clear_newline

    __printc "$desc_color" "\nRedirection\n"
    __dummy_prompt
    __printc "$fish_color_command" "brew"
    __printc "normal" " "
    __printc "$fish_color_param" "update"
    __printc "normal" " "
    __printc "$fish_color_redirection" "2>"
    __printc "normal" " "
    __printc "$fish_color_redirection" "/dev/null"
    __clear_newline

    __printc "$desc_color" "\nRoot prompt CWD\n"
    __printc "$fish_color_cwd_root" "/root"
    __printc normal "# "
    __printc "$fish_color_command" "foo"
    __clear_newline

    __printc "normal" "\n"
end

function colors::variables

    function __print_variable -a color text
        set -l text (printf "%-30s : $color" $text)
        __printc "$color" "$text"
        set_color -b normal; printf "\n"
    end

    __printc "normal" "\n"
    __print_variable "$fish_color_normal" "fish_color_normal"
    __print_variable "$fish_color_command" "fish_color_command"
    __print_variable "$fish_color_param" "fish_color_param"
    __print_variable "$fish_color_redirection" "fish_color_redirection"
    __print_variable "$fish_color_comment" "fish_color_comment"
    __print_variable "$fish_color_error" "fish_color_error"
    __print_variable "$fish_color_escape" "fish_color_escape"
    __print_variable "$fish_color_operator" "fish_color_operator"
    __print_variable "$fish_color_end" "fish_color_end"
    __print_variable "$fish_color_quote" "fish_color_quote"
    __print_variable "$fish_color_autosuggestion" "fish_color_autosuggestion"
    __print_variable "$fish_color_valid_path" "fish_color_valid_path"
    __print_variable "$fish_color_cwd" "fish_color_cwd"
    __print_variable "$fish_color_cwd_root" "fish_color_cwd_root"
    __print_variable "$fish_color_match" "fish_color_match"
    __print_variable "$fish_color_search_match" "fish_color_search_match"
    __print_variable "$fish_color_selection" "fish_color_selection"
    __print_variable "$fish_pager_color_prefix" "fish_pager_color_prefix"
    __print_variable "$fish_pager_color_completion" "fish_pager_color_completion"
    __print_variable "$fish_pager_color_description" "fish_pager_color_description"
    __print_variable "$fish_pager_color_progress" "fish_pager_color_progress"
    __print_variable "$fish_pager_color_secondary" "fish_pager_color_secondary"
    __print_variable "$fish_color_history_current" "fish_color_history_current"
    __print_variable "$fish_color_user" "fish_color_user"
    __print_variable "$fish_color_host" "fish_color_host"
    __print_variable "$fish_color_cancel" "fish_color_cancel"
    __printc "normal" "\n"
end

function __printc -a color text
    set_color normal
    eval "set_color $color"
    printf "$text"
end
