export VERSION="MacOS Shell Improvements v0.2 by justinas@eofnet.lt"
ver () {
echo "(c) 2019-2021 $VERSION"
}

tmstatus () {
  eval $(tmutil status | grep -E '[^}];$' | perl -p -e 's/^\s+[\"]*//g;' -e 's/[\"]*\s+\=\s+/=/g') || (echo "Something get wrong..." && return 1)

  if [[ $Running -eq 1 ]]
  then
    export LC_NUMERIC="en_US.UTF-8"
    [[ $BackupPhase == "Copying" ]] && Percent=$(printf '%0.2f%%' `bc <<< $Percent*100`) && echo "${DateOfStateChange} ${BackupPhase} backup to ${DestinationMountPoint}: ${totalFiles} files - ${Percent} (~$((${TimeRemaining:-0}/60)) min." || echo "${DateOfStateChange} ${BackupPhase} (Destination ${DestinationID})."
  else
    echo "TimeMachine backup is not running."
  fi
}

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

