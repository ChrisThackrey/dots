if type -q exa
  alias l 'exa -a --icons -g --group-directories-first --across' # my preferred listing
  alias la 'exa -al --icons --group-directories-first -h -H --across --git' # my preferred listing
  alias ll "exa -l -g --icons"
  alias lla "ll -a --group-directories-first --across --git"
  alias lsd "exa -D -g -icons --across --git"
  alias lt 'exa -aT --icons --group-directories-first' # tree listing
  alias ltg 'exa -aT --icons --group-directories-first --git'
end

nvm use 16.7.0 > /dev/null 2>&1