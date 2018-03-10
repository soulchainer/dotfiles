############### ENV VARIABLES ###############

## PATH

# USER BIN
PATH="$PATH:$HOME/bin"
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

## EDITORS

EDITOR="nvim"
VISUAL="nvim"

############### NON GUI PROGRAMS AT LOGIN ###############s

