export VERSION="MacOS Shell Improvements v0.1 by justinas@eofnet.lt"
ver () {
echo "(c) 2019 $VERSION"
}

#export PS1="🖥  \W $ "
export PS1="\[\033[1;32m\]\u@🖥 \[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]# "
# some aliases
alias c='clear'
alias ls='ls -G'
alias grep='grep --color=auto'
alias bs='bs -i'
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias now='date +"%T"'
# networking
alias header='curl -I'

