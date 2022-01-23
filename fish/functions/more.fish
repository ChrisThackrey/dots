if echo | command more -R >/dev/null 2>&1
    function more
        set -lx MORE '-R'
        type -q __highlight; and set -lx LESSOPEN '| __highlight %s'
        command more $argv
    end
end
