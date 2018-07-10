alias cp='cp -r --reflink=auto'
alias diff='diff --color --unified'
alias e='nvim'
alias grep='grep --color'
alias http-serve='python3 -m http.server'
alias makepkg-compress="PKGEXT='.pkg.tar.xz' makepkg"
alias mkdir='mkdir -p'
alias o='xdg-open'
alias sudo='sudo -E '

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias t='tmux'
alias ta='tmux attach'
alias c='cmus'
alias r='ranger'

alias ll="ls -l"
alias la="ll -a"
alias lk="ll -s=size"                # Sorted by size
alias lm="ll -s=modified"            # Sorted by modified date
alias lc="ll --created -s=created"   # Sorted by created date

function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# local web server
alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

