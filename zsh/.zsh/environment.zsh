export TERMINAL='urxvt'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export WORDCHARS='*?_.[]~&!#$%^(){}<>'

# My own binaries
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.node_modules/bin"

# browser-sync
ip=$(hostname -i)
export LOCAL_IP="${ip#* }"
