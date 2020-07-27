export GOROOT=/usr/local/go
export GOPATH=~/go
export GO111MODULE=on
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


export PATH="$HOME/.cargo/bin:$PATH"
