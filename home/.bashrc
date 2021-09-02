export PS1="\u@\h:\[\e[0;32m\]\w\[\e[0m\]\n$ "

#aliases
alias ls='ls -FGh'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias vi='nvim'
alias vim='nvim'
alias ovim='/usr/local/bin/vim' # original vim

alias gst='git st'

# ---------- peco ----------
export HISTCONTROL=ignoredups
export HISTIGNORE="history*:exit:ls:ll:cd:cd ~:vi:gst"
export HISTSIZE=10000
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    if [ $HISTCMD -gt 1 ]; then
      history -d $((HISTCMD-1))
    fi
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ]; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD
    if type osascript > /dev/null 2>&1; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi
  else
    # Remove the last entry, "peco-history"
    if [ $HISTCMD -gt 1 ]; then
      history -d $((HISTCMD-1))
    fi
  fi
}
bind -x '"\C-r":peco-history'

# ----- nvm -----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
