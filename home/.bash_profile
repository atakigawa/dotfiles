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

#add packer path
if [ -d "${HOME}/bin/packer_cmds" ]; then
  PATH=${PATH}:"${HOME}/bin/packer_cmds"
  export PACKER_CACHE_DIR="${HOME}/.packer_cache"
fi

#add ruby path
if [ -d "/usr/local/opt/ruby/bin" ]; then
    PATH="/usr/local/opt/ruby/bin":${PATH}
fi

#add SPTK path
if [ -d "/usr/local/SPTK/bin" ]; then
    PATH="/usr/local/SPTK/bin":${PATH}
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

#add GOPATH
GOPATH=$HOME/go
PATH=$PATH:$HOME/go/bin

export GOPATH
export PATH

if [ -e $(which pyenv) ]; then
    eval "$(pyenv init -)"
fi
if [ -e $(which python) ]; then
    export PYTHONSTARTUP="${HOME}/.pythonstartup.py"
fi
