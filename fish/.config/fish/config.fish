
set -x PATH $HOME/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin /snap/bin $PATH 
set -x EDITOR nvim
set -x GOPATH ~/go
set -x TERM 'xterm-256color'
set -x LANG en_GB.UTF-8
set -x BAT_THEME GitHub

set -x LDFLAGS "-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/libpq/lib"
set -x CPPFLAGS "-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/libpq/include"
set -x GRPC_PYTHON_BUILD_SYSTEM_OPENSSL 1
set -x GRPC_PYTHON_BUILD_SYSTEM_ZLIB 1


[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish


export NVM_DIR="$HOME/.nvm"
