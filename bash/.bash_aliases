############### Aliases ###############

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'

alias cpsec="cp -i"       # confirm before overwriting something
alias cpch="cp -Ru"       # copy files only if changed, for projects
alias diff="diff --color" # colorize diff

alias df='df -h'          # human-readable sizes
alias free='free -m'      # show sizes in MB

alias np='nano PKGBUILD'
alias vim='nvim'
alias git='LANGUAGE=en_US.UTF-8 git' # set git on english in terminal

## APACHE
alias apache='sudo systemctl start httpd.service'
alias apaches='sudo systemctl stop httpd.service'
alias apacher='sudo systemctl restart httpd.service'

## MYSQL
alias mysqli='sudo systemctl start mysqld.service'
alias mysqls='sudo systemctl stop mysqld.service'

## SSH
alias pissh='ssh -p 7766 osmc@192.168.1.11'

## QTILE
alias dqtile='startx $QTILE_DEV/.xinitrc'
alias xqtile='startx $QTILE_DEV/.xtrace-xinitrc'

## PYTHON
# Simple HTTP server (root folder is the current working folder)
alias pyserv='python -m http.server 8080'
# Python virtual environments (.virtualenvs) with virtualenvwrapper
# http://virtualenvwrapper.readthedocs.org/en/latest/
alias venvson='source virtualenvwrapper.sh' # enables virtual env. manager
alias addvenv='mkvirtualenv' # creates and enables a new env. (name given)
# same, but access restringed to globally installed python packages only
alias addvenvsys='mkvirtualenv --system-site-packages'
alias addvenv2='mkvirtualenv -p /usr/bin/python2.7' # with python2.7
# "workon environment_name" for enable/change an environment
# "workon" for list all the environments available
alias venvoff='deactivate'  # leave the environment
alias rmvenv='rmvirtualenv' # remove an environment (name given)
alias lsvenv='lssitepackages' # list content of venv's site-packages folder

## PELICAN
alias blog='cd ~/Desarrollo/OLD_DEV/Proyectos/Web/blog/ && venvson && workon blog'
alias pelicanup='pelican -s publishconf.py'

## PHP
# Simple HTTP server (root folder is the current folder)
alias phpserv='php -S localhost:8000'
