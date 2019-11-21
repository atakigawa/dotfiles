# source the system wide bashrc if it exists
if [ -e /etc/bashrc ]; then
  source /etc/bashrc
fi

# source the user's bashrc if it exists
if [ -e "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  PATH=${PATH}:"${HOME}/bin"
fi

#add ruby path
if [ -d "/usr/local/opt/ruby/bin" ]; then
    PATH="/usr/local/opt/ruby/bin":${PATH}
fi

#add chromium depot_tools path
if [ -d "/opt/depot_tools" ]; then
    PATH="/opt/depot_tools":${PATH}
fi

#add git diff-highlight path
diff_highlight="/usr/local/share/git-core/contrib/diff-highlight"
if [ -d ${diff_highlight} ]; then
    PATH=${diff_highlight}:${PATH}
fi

export LC_ALL=en_US.UTF-8

if [ -e $(which pyenv) ]; then
    eval "$(pyenv init -)"
fi
if [ -e $(which python) ]; then
    export PYTHONSTARTUP="${HOME}/.pythonstartup.py"
fi

# homeshick
if [ -e ~/.homesick/repos/homeshick/homeshick.sh ]; then
    source ~/.homesick/repos/homeshick/homeshick.sh
fi

# suppress warning
export BASH_SILENCE_DEPRECATION_WARNING=1
