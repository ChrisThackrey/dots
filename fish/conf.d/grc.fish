# grc.fish

set -l GRC (which grc)

if type -q $GRC
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias df='colourify df'
    alias ifconfig='colourify ifconfig'
    alias last='colourify last'
    alias wdiff='colourify wdiff'

    alias httping="colourify --config=conf.ping httping"
end
