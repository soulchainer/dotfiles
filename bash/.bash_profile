#
# ~/.bash_profile
#
if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

export PATH="$HOME/.cargo/bin:$PATH"
