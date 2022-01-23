function less
    set -lx LESS '-R'
    type -q __highlight; and set -lx LESSOPEN '| __highlight %s'
    command less $argv
end
