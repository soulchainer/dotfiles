############### ENV VARIABLES ###############

## PATH

# USER BIN
PATH="$PATH:$HOME/bin"
# GO
PATH=$PATH:$(go env GOPATH)/bin
# NODE
PATH="$HOME/.npm-global/bin:$PATH"
# PHP
PATH="$PATH:$HOME/.config/composer/vendor/bin"
# RUBY
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
# RUST
PATH="$HOME/.cargo/bin:$PATH"
# YARN (to have access to Yarn’s executables globally)
PATH="$PATH:`yarn global bin`"

export PATH

## EDITORS

export EDITOR="nvim"
export VISUAL="nvim"

## USER DIRS

export XDG_CONFIG_HOME="$HOME/.config"

############### NON GUI PROGRAMS AT LOGIN ###############

