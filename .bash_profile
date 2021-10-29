export PATH="/usr/local/go/bin:$PATH"
export GOPATH=~/go
export GO111MODULE=on
export PATH="$GOPATH/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

##export PATH="/usr/local/opt/awscli@1/bin:$PATH"

#export AWS_SDK_LOAD_CONFIG=1


export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
source "$HOME/.cargo/env"
eval "$(pyenv init --path)"

