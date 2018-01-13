#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### EXPORTS

# For Visual Studio Code for proper rendering when using diff-so-fancy
export LC_ALL=es_ES.UTF-8
export REACT_EDITOR=code

## GO
GOPATH="$HOME/Dev/go"

## For developing Qtile
QTILE_DEV="$HOME/.config/qtile/develop"

## PYTHON
# Limit pip usage to virtual environments
PIP_REQUIRE_VIRTUALENV=true
# Set destiny folder for new virtual environments
WORKON_HOME=~/.virtualenvs

## PROMPT
PS1="\[\e[1;36m\]┌─[\[\e[1;93m\]\u\[@${HOSTNAME%%.*}\\e[1;36m\]] \n\[\e[1;36m\]└─\[\e[1;36m\][\[\e[1;93m\]\W\[\e[1;36m\]] \[\e[1;92m\]\$ \[\e[10;95m\]\(^3^)/ \[\e[0m\]"

## GIT PROMPT CONFIGURATION ##

# SET CONFIG VARIABLES FIRSTet config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

# source the gitprompt script
source ~/.bash-git-prompt/gitprompt.sh

# By default, the general appearance of the git prompt is::

# (<branch> <branch tracking>|<local status>)

# The symbols are as follows:

#   Local Status Symbols
#       ✔: repository clean
#       ●n: there are n staged files
#       ✖n: there are n unmerged files
#       ✚n: there are n changed but unstaged files
#       …n: there are n untracked files
#       ⚑n: there are n stash entries
#   Branch Tracking Symbols
#       ↑n: ahead of remote by n commits
#       ↓n: behind remote by n commits
#       ↓m↑n: branches diverged, other by m commits, yours by n commits
#   Branch Symbol:
#   When the branch name starts with a colon :, it means it's actually a hash,
# not a branch (although it should be pretty clear, unless you name your
# branches like hashes :-)

########### Color codes ###############
# For usage in Prompt declaration need to be closed like \[color_code\]
# \e[0m       # Text Reset

# Regular Colors
# \e[0;30m       # Black
# \e[0;31m          # Red
# \e[0;32m        # Green
# \e[0;33m       # Yellow
# \e[0;34m         # Blue
# \e[0;35m       # Purple
# \e[0;36m         # Cyan
# \e[0;37m        # White

# Bold
# \e[1;30m       # Black
# \e[1;31m         # Red
# \e[1;32m       # Green
# \e[1;33m      # Yellow
# \e[1;34m        # Blue
# \e[1;35m      # Purple
# \e[1;36m        # Cyan
# \e[1;37m       # White

# Underline
# \e[4;30m       # Black
# \e[4;31m         # Red
# \e[4;32m       # Green
# \e[4;33m      # Yellow
# \e[4;34m        # Blue
# \e[4;35m      # Purple
# \e[4;36m        # Cyan
# \e[4;37m       # White

# Background
# \e[40m       # Black
# \e[41m         # Red
# \e[42m       # Green
# \e[43m      # Yellow
# \e[44m        # Blue
# \e[45m      # Purple
# \e[46m        # Cyan
# \e[47m       # White

# High Intensty
# \e[0;90m       # Black
# \e[0;91m         # Red
# \e[0;92m       # Green
# \e[0;93m      # Yellow
# \e[0;94m        # Blue
# \e[0;95m      # Purple
# \e[0;96m        # Cyan
# \e[0;97m       # White

# Bold High Intensty
# \e[1;90m      # Black
# \e[1;91m        # Red
# \e[1;92m      # Green
# \e[1;93m     # Yellow
# \e[1;94m       # Blue
# \e[1;95m     # Purple
# \e[1;96m       # Cyan
# \e[1;97m      # White

# High Intensty backgrounds
# \e[0;100m   # Black
# \e[0;101m     # Red
# \e[0;102m   # Green
# \e[0;103m  # Yellow
# \e[0;104m    # Blue
# \e[10;95m  # Purple
# \e[0;106m    # Cyan
# \e[0;107m   # White

## FUNCTIONS

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
