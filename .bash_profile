# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH";
# Add `usr/bin` to the `$PATH`
export PATH="/usr/bin:$PATH";
# Add /usr/local/bin to the $PATH
export PATH="/usr/local/bin:$PATH";
# Add pip3 site-packages location to the $PATH
export PATH="$HOME/.local/lib/python3.8/site-packages:$PATH";
export PATH="$HOME/.local/lib:$PATH";

# exa locations
export PATH="$HOME/.cargo:$PATH";
export PATH="$HOME/.cargo/bin:$PATH";
export PATH="$HOME/.cargo/env:$PATH";
export PATH="$HOME/.exa:$PATH";
export PATH="$HOME/.exa/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add GitHub CLI Tool to completions
eval "$(gh completion -s bash)";

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

export PATH="$HOME/.cargo/bin:$PATH";
export PAGER="most";

source "$HOME/.cargo/env";

# Deno path
export DENO_INSTALL="$HOME/.deno";
export PATH="$DENO_INSTALL/bin:$PATH";

# .NET SDK install location
export DOTNET_ROOT=/snap/dotnet-sdk/current

. "$HOME/.cargo/env"

eval "$(pyenv init --path)"

source /home/thacken/.config/broot/launcher/bash/br
