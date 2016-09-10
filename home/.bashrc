export PS1="\u@\h:\[\e[0;32m\]\w\[\e[0m\]\n$ "

#aliases
alias ls='ls -FGh'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias vi='vim'

alias gst='git st'

# ---------- peco ----------
export HISTCONTROL=ignoredups
export HISTIGNORE="history*:exit:ls:ll:cd:cd ~:vi:gst"
export HISTSIZE=10000
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    history -s $CMD
    if type osascript > /dev/null 2>&1 ; then
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi
  else
    history -d $((HISTCMD-1))
  fi
}
bind -x '"\C-r":peco-history'
