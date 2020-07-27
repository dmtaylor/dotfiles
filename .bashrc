# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# Source global bashrc, overwrite configs
if [ -f /etc/bashrc ] ; then
    . /etc/bashrc
fi

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

function is_macos {
    if [[ "$(uname)" = "Darwin" ]] ; then
        return 0
    else
        return 1
    fi
}

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Use vi keybindings
set -o vi

# set editor
export EDITOR=/usr/bin/nvim

# set prompt color
#export PS1="\e[0;32m$PS1\e[m"
export PS1="\[\e[0;32m\][\u@dev1:\l \W]\$ \[\e[m\]"
# enhance globbing behavior
#shopt -s nullglob
#shopt -s extglob

# set autocd
#shopt -s autocd
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

#misc options
shopt -s direxpand #expand directories in autocomplete
shopt -s checkjobs #don't hup bg jobs
shopt -s histverify # verify !$ and !! before running

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#export HISTCONTROL=ignoredups:erasedups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
#alias rm='rm -I'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
 alias df='df -Th'
 alias du='du -h'

# make view use vim rather than vi
alias view='nvim -Rp'

# use coreutils version over macos
if is_macos ; then
    which greadlink >/dev/null && alias readlink='greadlink'
    which ggrep >/dev/null && alias grep='ggrep --color'
    which gegrep >/dev/null && alias egrep='gegrep --color=auto '              # show differences in colour
    which gfgrep >/dev/null && alias fgrep='gfgrep --color=auto '              # show differences in colour
    which gfind >/dev/null && alias find='gfind'
    which gxargs >/dev/null && alias xargs='gxargs'
    which glocate >/dev/null && alias locate='glocate'
    which gcat >/dev/null && alias cat='gcat'
    which gsed >/dev/null && alias sed='gsed'
    which gcomm >/dev/null && alias comm='gcomm'
    which gwc >/dev/null && alias wc='gwc'
    which gawk >/dev/null && alias awk='gawk'
    which gtruncate >/dev/null && alias truncate='gtruncate'
    which gecho >/dev/null && alias echo='gecho'
    which gdate >/dev/null && alias date='gdate'
    which gtar >/dev/null && alias tar='gtar'
else
    alias grep='grep --color '                     # show differences in colour
    alias egrep='egrep --color=auto '              # show differences in colour
    alias fgrep='fgrep --color=auto '              # show differences in colour
fi

#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# Some shortcuts for different directory listings
 alias ls='ls -h --color=auto'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
 alias ll='ls -l'                              # long list
 alias la='ls -A'                              # all but . and ..
 alias lla='ls -lA'
# alias l='ls -CF'                              #
 alias vim='vim -p'
 alias nvim='nvim -p'
 alias cp='cp -i -p'
 alias jobs='jobs -l'
 alias ed='ed -p'
 alias info='info --vi-keys'

alias sudo='sudo -E'

# common typos
alias sl='ls'

# show the weather
alias weather='curl wttr.in/pao'

# print user defined env variables (begining with [a-z]
alias envp='compgen -A variable | grep "^[a-z]" | sort'

# git aliases
alias gsl="git log --pretty=short --abbrev"

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions

# source separate file for long functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

#export LESS="-N"

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ] ; then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
