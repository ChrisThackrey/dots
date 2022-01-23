set fish_greeting ""

set -gx TERM xterm-256color
set -x SHELL (which fish)

# env var for AppImages Wayland
# set -gx QT_QPA_PLATFORM 'wayland'

set -gx STARSHIP_CONFIG ~/.config/starship.toml

# theme
# set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user no
set -g theme_hide_hostname yes
set -g theme_hostname always

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# ORDER
# set -gx SPACEFISH_PROMPT_ORDER time user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char

# Preassign a value to `SPACEFISH_CHAR_SYMBOL`
# set -g SPACEFISH_CHAR_SYMBOL ❯

# USER
# set -gx SPACEFISH_USER_PREFIX "" # remove `with` before username
# set -gx SPACEFISH_USER_SUFFIX "" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
# set -gx SPACEFISH_HOST_PREFIX "@:("
# set -gx SPACEFISH_HOST_SUFFIX ") "

# Unwrap git status from `[...]`
# set -gx STARSHIP_GIT_STATUS_PREFIX ""
# set -gx STARSHIP_GIT_STATUS_SUFFIX ""

# Set exa paths
fish_add_path ~/.exa
fish_add_path ~/.exa/bin

set -gx VISUAL nvim

# Add PATH variables
set -gx NVM_DIR ~/.nvm

# Set python PATH variable
set -gx PYTHONPATH /usr/bin/python3.8

set -gx ANDROID_HOME ~/Android/Sdk
set -gx ANDROID_SDK_ROOT ~/Android/Sdk

set -gx DENO_INSTALL ~/.deno

# Set you-should-use msg to display before execution
set -g YSU_MESSAGE_POSITION "before"

# NNN Plugins  [https://github.com/jarun/nnn/tree/master/plugins#configuration]
set -gx NNN_PLUGIN_DIR ~/.config/nnn/plugins
set -gx NNN_TMPFILE ~/.tmp/nnn  # cd on quit always
set -gx LC_COLLATE "C"  # show all hidden files on top

# Bookmarks
# listed in the help and config screen (key ?)
# Symlinked bookmarks
# To add a new bookmark, visit the directory and press B. Note that , only remembers a location in memory.
# To jump back and forth a specific directory during a session, you can mark the directory (key ,).
# Visit it anytime using the Bookmark key followed by ,
set -gx NNN_BMS "d:$HOME/Documents/;u:/home/thacken/;D:$HOME/Downloads/;v:$HOME/dev/;m:$HOME/dev/main/;x:$HOME/dev/main/algoexpert/;s:$HOME/dev/main/speed-reader-next/;t:$HOME/dev/main/thacken.io/;l:$HOME/dev/main/leetwars/;n:$HOME/dev/main/mvp-node-editor/;r:$HOME/dev/main/refs;a:$HOME/dev/main/adamantite/;c:$HOME/dev/main/ChrisThackrey/"

# plugin finder can be invoked with the keybind ;f, fzopen can be run with ;o and so on...
# Alternatively, combine with Alt (i.e. Alt+key)
# To show the output of run-and-exit commands which do not need user input, add | (pipe) after !
## This option is incompatible with & (terminal output is masked for GUI programs) and ignores * (output is already paged for user)
set -gx NNN_PLUG 'f:finder;o:fzopen;y:-!sync*;p:-!less -iR $nnn*;d:-!git diff;i:-!|mediainfo $nnn;t:-!|tree -ps;k:-!|lc;l:-!git log;v:imgview;x:!chmod +x $nnn;g:!git log;s:-!&smplayer -minigui $nnn;m:-!&mousepad $nnn;c:!convert $nnn png:- | xclip -sel clipboard -t image/png*;e:-!sudo -E lvim $nnn*'

# Enabled Options:
# ;f - finder
# ;o - fzopen
# ;y - flush cached writes
# ;p - page through hovered file in less
# ;d - show git diff
# ;i - show media info
# ;t - show directory tree
# ;k - show keybindings
# ;l - show git log
# ;v - show image viewer
# ;x - make a file executable
# ;g - show the git log of a git project directory
# ;s - play hovered media file, even unfinished download
# ;m - open a media file with mousepad
# ;c - copy image to clipboard
# ;e - edit file as root in vim

# Other options:
# n:-!vi /home/user/Dropbox/dir/note*    # Take quick notes in a synced file/dir of notes
# k:-!fuser -kiv $nnn*                   # Interactively kill process(es) using hovered file

# NTL (NPM|PNPM|YARN Task CLI Runner)
set -gx NTL_RUNNER pnpm   # pnpm | yarn | npm

set -gx npm_config_target_arch "x64"

# Path to Rust Source Code Install directory
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

# Add snaps to the PATH
fish_add_path /snap/bin
fish_add_path /snap/bin/flutter
fish_add_path /snap/bin/dart
fish_add_path /snap/bin/kotlin

# Add Android Sdk locale to the PATH
fish_add_path ~/Android/Sdk

# Lua path
fish_add_path /usr/local/bin/lua

# NPM global packages
fish_add_path ~/.nvm/versions/node/(node -v)/lib

# pnpm path
fish_add_path ~/.nvm/.npm-packages/bin
fish_add_path ~/.nvm/.npm-packages/bin/pnpm

# NeoVim Paths
fish_add_path ~/.local/share/nvim
fish_add_path ~/.local/share/nvim/site
fish_add_path ~/.local/share/nvim/runtime
fish_add_path ~/.local/share/nvim/plugged
fish_add_path ~/.local/share/nvim/lsp_servers
fish_add_path ~/.local/share/lunarvim
fish_add_path ~/.local/share/lunarvim/lvim
fish_add_path ~/.local/share/lunarvim/site

# aliases
alias cl clear
alias cla "clear && printf '\e[3J'"
alias g git
alias nne "nnn -e"
alias nnd "nnn -de"
alias N='sudo -E nnn -dH'
# Copy the output from a command to the system clipboard, using short notation:
alias cpwd "$SCRIPTS/copy-pwd.sh"
alias cdwd ". $SCRIPTS/cd-clipdir.fish"
# Paste the contents of the system clipboard to the console:
alias ppwd "$SCRIPTS/paste-clipdir.sh"
alias uu "sudo apt update && apt list --upgradable"
alias up "sudo apt update && apt list --upgradable"
alias upp "sudo apt update && sudo apt upgrade -y"
alias nu "ncu -g"
alias nlg "npm list --global --depth=0"
alias nls "npm ls --depth=0"
alias nig 'npm install --global'
alias ni 'npm install'
alias nid 'npm install --save-dev'
alias nt 'npm test'
alias nit 'npm install && npm test'
alias nk 'npm link'
alias nr 'npm run'
alias ns 'npm start'
alias nf 'npm cache clean && rm -rf node_modules && npm install'
alias pi 'pnpm add'
alias pid 'pnpm install --save-dev'
alias pt 'pnpm test'
alias pit 'pnpm install && pnpm test'
alias pk 'pnpm link'
alias pn 'pnpm'
alias pns 'pnpm start'
alias pf 'pnpm cache clean && rm -rf node_modules && pnpm install'
alias y "yarn"
alias yu "yarn global upgrade"
alias yp "yarn global list"
alias yarnlist "yarn global list"
alias qq exit
alias hyi "hyper i"
alias nwoff "sudo nmcli networking off"
alias nwon "sudo nmcli networking on"
alias re "sudo nmcli networking off && sleep 4 && sudo nmcli networking on"
alias tldr "tldr --theme base16"
alias ktup "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias nanosyn "nano --boldtext --indicator --linenumbers --nonewlines --autoindent --minibar"
alias nanosh "nano --boldtext --indicator --linenumbers --nonewlines --autoindent --minibar --syntax=sh"
alias nanolua "nano --boldtext --indicator --linenumbers --nonewlines --autoindent --minibar --syntax=lua"
alias lv lvim
alias nv lvim
alias igrep "grep -i"
alias sgrep "$SCRIPTS/grep-i.sh "
# Fish Config
alias fishconf "lvim ~/.config/fish/config.fish"
# Neovim Config
alias lvconf "lvim ~/.config/lvim/config.lua"
alias lvbak "lvim ~/.config/lvim/config.lua.bak"
# Lunarvim Language-Specific Settings
set -gx TREESDIR "~/.config/lvim/after/ftplugin"
alias trees "lvim $TREESDIR"
alias lctrees "lc ~/.config/lvim/after/ftplugin"
# Konsole Config
alias konf "nanosyn ~/.local/share/konsole/Thacken.profile"
# Zsh Config
# alias zshrc "lvim ~/.zshrc"
# alias zshpath "lvim ~/.zshrc.d/.path"
# alias zshaliases "lvim ~/.zshrc.d/.aliases"
# alias zshresets "lvim ~/.zshrc.d/.alias-resets"
# alias zshfuncs "lvim ~/.zshrc.d/.functions"
# alias zshexports "lvim ~/.zshrc.d/.exports"
# alias zshprofile "lvim ~/.zshrc.d/.zprofile"
# alias zshenv "lvim ~/.zshenv"
# alias zshinit "lvim ~/.zshrc.d/.zsh_init"
# Bash Config
alias bashpath "lvim ~/.path"
alias bashaliases "lvim ~/.aliases"
alias bashprofile "lvim ~/.bash_profile"
alias bashrc "lvim ~/.bashrc"
# alias bashexports "lvim ~/.exports"
alias bashfuncs "lvim ~/.functions"
# Git Config
alias editgit "lvim ~/.gitconfig"
alias gitmessage "lvim ~/.gitmessage.txt"
# alias gitmuxconf "lvim ~/.gitmux.conf"
# Hyper Config
alias hyperconf "lvim ~/.hyper.js"
# Profile ($HOME)
alias editprofile "lvim ~/.profile"
# Global Prettier Config
alias prettierrc "lvim ~/.prettierrc"
# Tmux Config
# alias tmuxconf "lvim ~/.tmux.conf"
# alias tmuxpowerconf "lvim ~/.tmux.powerline.conf"
# Starship Config
# alias starshipconf "lvim ~/starship.toml"
# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep "grep --color=auto"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
# Get week number
alias week "date +%V"
# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map "xargs -n1"
# alias night "gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true"
# alias day "gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false"
alias lc "colorls -A --group-directories-first --dark"
alias lca "colorls -lA --group-directories-first --dark"
alias lcf "colorls -lA --dark"
alias lt "exa -aT --icons --color=always --group-directories-first -g -h -H --git "
alias ls "exa -a --icons --color=always --group-directories-first -g -G -x -h -H --git "
alias tablet "sh /home/thacken/.drivers/Linux_Pentablet_V1.2.13.1/Pentablet_Driver.sh"
# alias surfsup "cd /etc/openvpn && surfs && sudo openvpn us-hou.prod.surfshark.com_udp.ovpn"
# alias surfsettings "firefox https://my.surfshark.com/vpn/manual-setup/main"
# alias surfs "open ~/.config/surfsettings.txt"
# alias sharkdown "sudo surfshark-vpn down"
# alias shark "sudo surfshark-vpn"
# alias sharkattack "sudo surfshark-vpn attack"
# Establish a Multihop VPN connection:
# alias sharks "sudo surfshark-vpn multi"
# alias sharkstatus "sudo surfshark-vpn status"
alias home "cd ~"
alias gc "~/.scripts/xclipgit.sh"
alias open "xdg-open"
# alias cheat "/usr/local/bin/cheat-linux-amd64"
# alias check-updates "sudo apt update && apt list --upgradable"
# confirm before overwriting something
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
# adding flags
alias df "df -h"                          # human-readable sizes
alias free "free -m"                      # show sizes in MB
# youtube-dl
# alias yta-aac "youtube-dl --extract-audio --audio-format aac "
# alias yta-best "youtube-dl --extract-audio --audio-format best "
# alias yta-flac "youtube-dl --extract-audio --audio-format flac "
# alias yta-m4a "youtube-dl --extract-audio --audio-format m4a "
# alias yta-mp3 "youtube-dl --extract-audio --audio-format mp3 "
# alias yta-opus "youtube-dl --extract-audio --audio-format opus "
# alias yta-vorbis "youtube-dl --extract-audio --audio-format vorbis "
# alias yta-wav "youtube-dl --extract-audio --audio-format wav "
# alias ytv-best "youtube-dl -f bestvideo+bestaudio "
command -qv nvim && alias vim nvim

set -gx DEV ~/dev/main
set -gx ALGO ~/dev/main/algoexpert
set -gx ALGOS ~/dev/.archive/hack-reactor/main/opt/toy-problems
set -gx MVP_REF ~/dev/.archive/hack-reactor/main/mvp/mvp-node-editor
set -gx MVP_REFS ~/dev/.archive/hack-reactor/main/mvp
set -gx FEC_REF ~/dev/.archive/hack-reactor/main/adamantite
set -gx FEC_REFS ~/dev/.archive/hack-reactor/main/fec
set -gx SDC_REFS ~/dev/.archive/hack-reactor/main/sdc
set -gx BLUE_OCEAN ~/dev/.archive/hack-reactor/main/blue_ocean
set -gx HR_ARCHIVE ~/dev/.archive/hack-reactor/main
set -gx LEETWARS ~/dev/main/leetwars
set -gx BLACKBIRD ~/dev/main/speed-reader-next
set -gx NODE_EDITOR ~/dev/main/mvp-node-editor
set -gx ADAMANTITE ~/dev/main/adamantite
set -gx ADAMANTITE_NEXT ~/dev/main/adamantite/adamantite-next
set -gx ADAMANTITE_CLIENT ~/dev/main/adamantite/adamantite-astro
set -gx ADAMANTITE_SERVER ~/dev/main/adamantite/adamantite-server
set -gx WEBSITE ~/dev/main/thacken.io
set -gx GITHUB_README ~/dev/main/ChrisThackrey
set -gx REFS ~/dev/main/refs
set -gx REPOS ~/dev/repos
set -gx TEMPLATES ~/dev/templates
set -gx META ~/dev/meta-typing
set -gx ARCHIVE ~/dev/.archive
set -gx SCRIPTS ~/.scripts
set -gx FONTS ~/.fonts
# ==================================== #
#      Custom Directory Shortcuts      #
# ==================================== #
alias dev "cd $DEV"
alias _algox "cd $ALGO"
alias _tp "cd $ALGOS"
alias _algos "cd $ALGOS"
alias _lw "cd $LEETWARS"
alias _hr "cd $HR_ARCHIVE"
alias _sr "cd $BLACKBIRD"
alias _ocean "cd $BLUE_OCEAN"
alias _mvpr "cd $MVP_REF"
alias _mvps "cd $MVP_REFS"
alias _mvp "cd $NODE_EDITOR"
alias _adamantite "cd $ADAMANTITE"
alias _nextite "cd $ADAMANTITE_NEXT"
alias _strotite "cd $ADAMANTITE_CLIENT"
alias _restite "cd $ADAMANTITE_SERVER"
alias _io "cd $WEBSITE"
alias _web "cd $WEBSITE"
alias _md "cd $GITHUB_README"
alias _refs "cd $REFS"
alias _sdc "cd $SDC_REF"
alias _sdcs "cd $SDC_REFS"
alias _fec "cd $FEC_REF"
alias _fecs "cd $FEC_REFS"
alias _repos "cd $REPOS"
alias _templates "cd $TEMPLATES"
alias _meta "cd $META"
alias _archive "cd $ARCHIVE"
alias _fish-confs "cd ~/.config/fish"
alias _lvim-confs "cd ~/.config/lvim"
alias _nvim-confs "cd ~/.config/nvim"
alias _cmds "cd $SCRIPTS"
alias _scripts "cd $SCRIPTS"
alias _fonts "cd $FONTS"
# ==================================== #
#            Open With Code            #
# ==================================== #
alias algox "code $ALGO"
alias algoexpert "lvim $ALGO"
alias toys "code $ALGOS"
alias leet "lvim $LEETWARS"
alias leetwars "code $LEETWARS"
alias hackr "code $HR_ARCHIVE"
alias srn "code $BLACKBIRD"
alias sr71 "code $BLACKBIRD"
alias blackbird "code $BLACKBIRD"
alias speed_reader_next "code $BLACKBIRD"
alias blueocean "code $BLUE_OCEAN"
alias mvpref "code $MVP_REF"
alias mvprefs "code $MVP_REFS"
alias nodeeditor "code $NODE_EDITOR"
alias adamantite "code $ADAMANTITE"
alias nextite "code $ADAMANTITE_NEXT"
alias strotite "code $ADAMANTITE_CLIENT"
alias restite "code $ADAMANTITE_SERVER"
alias website "code $WEBSITE"
alias readme "code $GITHUB_README"
alias refs "code $REFS"
alias sdcref "code $SDC_REF"
alias fecref "code $FEC_REF"
alias meta "code $META"
alias cmds "code $SCRIPTS"
alias scripts "code $SCRIPTS"
# ==================================== #
#          Dir Abbreviations           #
# ==================================== #
alias h "cd ~"
alias m "cd ~"
alias p1 "cd .."
alias p2 "cd ../.."
alias p3 "cd ../../.."
alias p4 "cd ../../../.."
alias p5 "cd ../../../../.."
alias p6 "cd ../../../../../.."
alias p7 "cd ../../../../../../.."
alias p8 "cd ../../../../../../../.."
alias p9 "cd ../../../../../../../../.."
alias d "cd ~/dev"
alias dm "cd ~/dev/main"
alias rdr "cd $BLACKBIRD && lc"
alias rdrlc "lc $BLACKBIRD"
alias vsr "code $BLACKBIRD"
alias lvsr "lvim $BLACKBIRD"
alias io "code $WEBSITE"
alias lcio "lc $WEBSITE"
alias cdio "cd $WEBSITE && lc"
alias lvio "lvim $WEBSITE"
alias lx "lvim $ALGO"
alias lxrf "lvim $ALGOS"
alias ax "code $ALGO"
alias axrf "code $ALGOS"
alias lvleet "lvim $LEETWARS"
alias vsclt "code $LEETWARS"
alias lcleet "lc $LEETWARS"
alias lcmvp "lc $NODE_EDITOR"
alias lvmvp "lvim $NODE_EDITOR"
alias vscmvp "code $NODE_EDITOR"
alias lcbl "lc $BLUE_OCEAN"
alias lvbl "lvim $BLUE_OCEAN"
alias vscbl "code $BLUE_OCEAN"
alias lcsdc "lc $SDC_REF"
alias lcsdcs "lc $SDC_REFS"
alias vscsdc "code $SDC_REF"
alias vscsdcs "code $SDC_REFS"
alias lcfec "lc $ADAMANTITE_NEXT"
alias lcfecs "lc $FEC_REFS"
alias lvfec "lvim $ADAMANTITE_NEXT"
alias lvfecs "lvim $FEC_REFS"
alias vscfec "code $ADAMANTITE_NEXT"
alias vscfecs "code $FEC_REFS"
alias lcad "lc $ADAMANTITE_CLIENT"
alias lcads "lc $ADAMANTITE_SERVERS"
alias lvad "lvim $ADAMANTITE_CLIENT"
alias lvads "lvim $ADAMANTITE_SERVERS"
alias vscad "code $ADAMANTITE_CLIENT"
alias vscads "code $ADAMANTITE_SERVERS"
alias feclc "lc $FEC_REF"
alias feclv "lvim $FEC_REF"
alias fecvsc "code $FEC_REF"
# ==================================== #
#          Open With LunarVim          #
# ==================================== #
# alias __algox "lvim $ALGO"
# alias __algoexpert "lvim $ALGO"
# alias __toys "lvim $ALGOS"
# alias __algos "lvim $ALGOS"
# alias __algo_refs "lvim $ALGOS"
# alias __toyproblems "lvim $ALGOS"
# alias __leet "lvim $LEETWARS"
# alias __leetwars "lvim $LEETWARS"
# alias __hackr "lvim $HR_ARCHIVE"
# alias __sr "lvim $BLACKBIRD"
# alias __srn "lvim $BLACKBIRD"
# alias __sr71 "lvim $BLACKBIRD"
# alias __blackbird "lvim $BLACKBIRD"
# alias __speed_reader_next "lvim $BLACKBIRD"
# alias __ocean "lvim $BLUE_OCEAN"
# alias __blueocean "lvim $BLUE_OCEAN"
# alias __blue_ocean "lvim $BLUE_OCEAN"
# alias __mvp "lvim $MVP_REF"
# alias __mvps "lvim $MVP_REFS"
# alias __mvpref "lvim $MVP_REF"
# alias __mvprefs "lvim $MVP_REFS"
# alias __mvp_ref "lvim $MVP_REF"
# alias __mvp_refs "lvim $MVP_REFS"
# alias __tesla "lvim $NODE_EDITOR"
# alias __nodeeditor "lvim $NODE_EDITOR"
# alias __mvp_node_editor "lvim $NODE_EDITOR"
# alias __electron_node_editor "lvim $NODE_EDITOR"
# alias __adamantite "lvim $ADAMANTITE"
# alias __nextite "lvim $ADAMANTITE_NEXT"
# alias __adamantite_next "lvim $ADAMANTITE_NEXT"
# alias __strotite "lvim $ADAMANTITE_CLIENT"
# alias __adamantite_client "lvim $ADAMANTITE_CLIENT"
# alias __restite "lvim $ADAMANTITE_SERVER"
# alias __adamantite_server "lvim $ADAMANTITE_SERVER"
# alias __io "lvim $WEBSITE"
# alias __web "lvim $WEBSITE"
# alias __website "lvim $WEBSITE"
# alias __thackenIo "lvim $WEBSITE"
# alias __aboutme "lvim $GITHUB_README"
# alias __readme "lvim $GITHUB_README"
# alias __meta "lvim $META"
# alias __metas "lvim $META"
# alias __metatypes "lvim $META"
# alias __cmds "lvim $SCRIPTS"
# alias __commands "lvim $SCRIPTS"
# alias __scripts "lvim $SCRIPTS"
# alias __refs "lvim $REFS"
# alias __sdc "lvim $SDC_REF"
# alias __sdc_ref "lvim $SDC_REF"
# alias __sdcs "lvim $SDC_REFS"
# alias __sdc_refs "lvim $SDC_REFS"
# alias __fec "lvim $FEC_REF"
# alias __fec_ref "lvim $FEC_REF"
# alias __fecs "lvim $FEC_REFS"
# alias __fec_refs "lvim $FEC_REFS"
# alias __templates "lvim $TEMPLATES"

# Make vim the default editor.
set -gx EDITOR nvim

fish_add_path bin
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path /usr/bin
fish_add_path /usr/local/bin
fish_add_path ~/.config
fish_add_path ~/.local/share

set -gx MANPATH /usr/share/man
set -gx CHEAT_CONFIG_PATH ~/.config/cheat/conf.yml

# .NET SDK install location
set -gx DOTNET_ROOT /snap/dotnet-sdk/current

# Set OS for tldr cheatsheets
set -gx TLDR_OS linux

set -gx GITSTATUS_LOG_LEVEL DEBUG

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
set -gx PYTHONIOENCODING 'UTF-8'

# Increase Bash history size. Allow 32³ entries; the default is 500.
set -gx HISTSIZE '32768'
set -gx HISTFILESIZE $HISTSIZE
# Omit duplicates and commands that begin with a space from history.
set -gx HISTCONTROL "ignoreboth"

# Highlight section titles in manual pages.
set -gx LESS_TERMCAP_md "$blue"

# less
set -x PAGER less
set -x LESS '-R'
set -x MORE '-R'
set -x MANPAGER 'less -R'

# Compilation flags
set -gx ARCHFLAGS "-arch x86_64"
set -gx CPPFLAGS -I/usr/include/iniparser

# PYENV
fish_add_path ~/.pyenv/shims
set -gx PYENV_ROOT ~/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# NodeJS
fish_add_path node_modules/.bin

# Go
set -gx GOPATH /usr/local/go/bin
set -gx GOBIN /usr/local/go/bin/bin
set -gx GOEXE /usr/local/go/bin/go
set -gx GOROOT /usr/local/go
fish_add_path $GOROOT
fish_add_path $GOPATH
fish_add_path $GOBIN
fish_add_path $GOEXE

if test -d ~/.bin
  fish_add_path ~/.bin
end

if test -d ~/.local/bin
  fish_add_path ~/.local/bin
end

# Yarn global packages
fish_add_path ~/.yarn/bin

# Set Node.js path to nvm installed version
fish_add_path ~/.nvm/versions/node/(node -v)/bin/node

fish_add_path ~/.config/npm/global/lib
fish_add_path ~/.config/npm/global/bin
fish_add_path ~/.nvm/.npm-packages/bin
fish_add_path ~/opt

# python
fish_add_path /usr/bin/python
# python3
fish_add_path /usr/bin/python3

# Rust paths
fish_add_path ~/.cargo
fish_add_path ~/.cargo/bin
fish_add_path ~/.cargo/env

# Android SDK paths
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/tools
fish_add_path ~/Android/Sdk/tools
fish_add_path ~/Android/Sdk/platform-tools

# Ruby paths
fish_add_path ~/.rbenv/bin
fish_add_path ~/.rbenv/plugins/ruby-build/bin

# Deno
fish_add_path ~/.deno
fish_add_path ~/.deno/bin

fish_add_path /usr/share/doc

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

# GHQ
set -g GHQ_SELECTOR fzf
set -g GHQ_SELECTOR_OPTS '--prompt="ghq> "'

# FZF
set -x FZF_DEFAULT_OPTS '--bind ctrl-f:page-down,ctrl-b:page-up --ansi --no-sort --reverse --color bg+:13,hl:3,pointer:7'
set -g FZF_LEGACY_KEYBINDINGS 0
set -l FZF (which fzf)
if ! type -q $FZF
  echo "$status"
  echo "You'll need to install fzf or your history search will be broken."
  echo
  echo
  echo "Install instructions can be found at https://github.com/junegunn/fzf/"
else
  # Load fzf bindings & completions
  fish_add_path /usr/share/doc/fzf
  source /usr/share/doc/fzf/examples/key-bindings.fish
  fish_add_path /usr/share/doc/fzf/examples/plugins
end

# rbenv
if [ -d $HOME/.rbenv/bin ]
  set PATH $PATH $HOME/.rbenv/bin
end

if type -fq rbenv
    rbenv init - | source
end

# venv
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

if type -qf python3
  alias python="python3"
end

if type -qf pip3
  alias pip="pip3"
end

zoxide init fish | source

source (dirname (status --current-filename))/config-linux.fish

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# mcfly init fish | source

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and source ~/.config/tabtab/fish/__tabtab.fish; or true
### SETTING THE STARSHIP PROMPT ###
starship init fish | source
