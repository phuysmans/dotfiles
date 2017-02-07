#!/bin/bash

# load the dotfiles
for file in ~/.{path,exports,functions,dockerfunc,aliases}; do
		if [[ -r "$file" ]] && [[ -f "$file" ]]; then
			source "$file"
		fi
done
unset file

# case insensitive globbing
shopt -s nocaseglob

# bash history append
shopt -s histappend

# autocorrect path when using cd
shopt -s cdspell

# tab completion .ssh/config
#[[ -e "$HOME/.ssh/config" ]] \
#	&& complete \
#		-o "default" \
#		-o "nospace" \
#		-W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" \
#		scp sftp ssh


# fortune cookie
# fortune
