typeset -U path

path=(
	/sbin
	~/bin
    ~/.local/bin
    ~/.cargo/bin
	$path[@]
)

# exports
export GPG_TTY=$(tty)
