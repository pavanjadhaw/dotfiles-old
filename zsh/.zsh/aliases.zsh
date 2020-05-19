alias :q=exit
alias cp='cp -r --reflink=auto'
alias diff='diff --color --unified'
alias grep='grep --color'
alias http-serve='python3 -m http.server'
alias makepkg-compress="PKGEXT='.pkg.tar.xz' makepkg"
alias mkdir='mkdir -p'
alias o='xdg-open'
alias sudo='sudo -E '
alias v='nvim'

alias ll="ls -l"
alias la="ll -a"
alias lk="ll --sort=size"   # Sorted by size
alias lm="ll -t"            # Sorted by modified date
alias lc="ll --created -s=created"   # Sorted by created date

function mkd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

x0x() {
	curl -F "file=@${1}" https://0x0.st
}

shrt() {
	curl -F "shorten=${1}" https://0x0.st
}
