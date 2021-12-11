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

# brew
if [ -d /opt/homebrew/bin ]; then
    # eval "$(/opt/homebrew/bin/brew shellenv)"
    PATH=/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}
fi

# add git diff-highlight path
diff_highlight="/opt/homebrew/share/git-core/contrib/diff-highlight"
if [ -d ${diff_highlight} ]; then
    PATH=${diff_highlight}:${PATH}
fi

export LC_ALL=en_US.UTF-8

if [ -e $(which pyenv) ]; then
    eval "$(pyenv init --path)"
    # eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
if [ -e $(which python) ]; then
    export PYTHONSTARTUP="${HOME}/.pythonstartup.py"
fi

if [ -e $(which rbenv) ]; then
    eval "$(rbenv init -)"
fi

# homeshick
if [ -e ~/.homesick/repos/homeshick/homeshick.sh ]; then
    source ~/.homesick/repos/homeshick/homeshick.sh
fi

# suppress warning
export BASH_SILENCE_DEPRECATION_WARNING=1
