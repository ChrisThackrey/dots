[ -n "$PS1" ] && source ~/.bash_profile
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# NTL (NPM|PNPM|YARN Task CLI Runner)
export NTL_RUNNER=pnpm # pnpm | yarn | npm

export npm_config_target_arch=x64

# env var for AppImage Wayland
export QT_QPA_PLATFORM=wayland

complete -C /usr/bin/terraform terraform

# Note:
#   mi - completion options color (Bash 4.4 and later)
#   so - completion matching-prefix color (Bash 4.4 and later)
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;81:pi=38;5;43:bd=38;5;212:\
cd=38;5;225:or=30;48;5;202:ow=38;5;75:so=38;5;177:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:\
*.jpg=38;5;141:*.jpeg=38;5;147:*.png=38;5;147:\
*.mpg=38;5;151:*.mpeg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:\
*.mp4=38;5;217:*.mkv=38;5;216:\
*.flac=38;5;223:*.mp3=38;5;218:*.wav=38;5;213:*.ape=38;5;213::*.ogg=38;5;215:\
*akefile=38;5;176:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:\
*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:\
*.epub=38;5;152:*.mobi=38;5;105:*.m4b=38;5;222:*.conf=38;5;121:\
*.md=38;5;224:*.markdown=38;5;224:*README=38;5;224:*.ico=38;5;140:\
*package.json=38;5;11:*Gemfile=38;5;11:*Dockerfile=38;5;11:\
*.iso=38;5;205"
export EXA_COLORS="reset:da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239:*.ts=00"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thacken/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/thacken/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/home/thacken/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/thacken/anaconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
source $(dirname $(gem which colorls))/tab_complete.sh
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
eval "$(pyenv init -)"

nnn_cd() {
	if ! [ -z "$NNN_PIPE" ]; then
		printf "%s\0" "0c${PWD}" ! >"${NNN_PIPE}" &
	fi
}

trap nnn_cd EXIT
###-begin-redrun-completion-###
#
# redrun npm-scripts completion script
#
# Installation: redrun-completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: redrun-completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
	_redrun_completion() {
		local words cword
		if type _get_comp_words_by_ref &>/dev/null; then
			_get_comp_words_by_ref -n = -n @ -w words -i cword
		else
			cword="$COMP_CWORD"
			words=("${COMP_WORDS[@]}")
		fi

		local si="$IFS"
		cword=2

		words[2]=${words[1]}
		words[1]='run'

		IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
			COMP_LINE="$COMP_LINE" \
			COMP_POINT="$COMP_POINT" \
			npm completion -- "${words[@]}" \
			2>/dev/null)) || return $?
		IFS="$si"
	}
	complete -o default -F _redrun_completion redrun
elif type compdef &>/dev/null; then
	_redrun_completion() {
		words[3]=${words[2]}
		words[2]='run'

		local si=$IFS
		compadd -- $(COMP_CWORD=$((CURRENT)) \
			COMP_LINE=$BUFFER \
			COMP_POINT=0 \
			npm completion -- "${words[@]}" \
			2>/dev/null)
		IFS=$si
	}
	compdef _redrun_completion redrun
elif type compctl &>/dev/null; then
	_redrun_completion() {
		local cword line point words si
		read -Ac words
		read -cn cword
		read -l line
		read -ln point
		si="$IFS"

		words[3]=${words[2]}
		words[2]='run'

		IFS=$'\n' reply=($(COMP_CWORD="$cword" \
			COMP_LINE="$line" \
			COMP_POINT="$point" \
			npm completion -- "${words[@]}" \
			2>/dev/null)) || return $?
		IFS="$si"
	}
	compctl -K _redrun_completion redrun
fi
###-end-redrun-completion-###

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true

source /home/thacken/.config/broot/launcher/bash/br
# eval "$(mcfly init bash)"
### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"