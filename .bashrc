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

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Use vi keybindings
shopt -s vi

# set prompt color
export PS1="\[\e[0;32m\][\u@\h \W]\$ \[\e[m\]"
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
alias rm='rm -I'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
 alias df='df -Th'
 alias du='du -h'

# make view use vim rather than vi
alias view='vim -Rp'

#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
 alias grep='grep --color '                     # show differences in colour
 alias egrep='egrep --color=auto '              # show differences in colour
 alias fgrep='fgrep --color=auto '              # show differences in colour
#
# Some shortcuts for different directory listings
 alias ls='ls -h --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
 alias ll='ls -l'                              # long list
 alias la='ls -A'                              # all but . and ..
 alias lla='ls -lA'
# alias l='ls -CF'                              #
 alias vim='vim -p'
 alias cp='cp -i -p'
 alias jobs='jobs -l'
 alias ed='ed -p'
 alias info='info --vi-keys'

# show the weather
alias weather='curl wttr.in/sjc'

# print user defined env variables (begining with [a-z]
alias envp='env | grep "^[a-z]" | sort'

# Cygwin aliases
#alias open='cygstart'

# Machine specific aliases go here

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
function wcl {
    echo -ne '\e''[5i'
    cat $*
    echo -ne '\e''[4i'
    echo "Copied to Windows clipboard" 1>&2
}

function wcb { 
    cat <(echo -ne '\e''[5i') - <(echo -ne '\e''[4i') 
}

# up command: stolen from HN
function up {
    local d=""
    limit="$1"
    case $limit in
        *[!0-9]*)
            echo "$limit is not a number"
            return
            ;;
        *) ;;
    esac
    for ((i=1 ; i <= limit ; i++)) ; do
        d="$d/.."
    done
    d="$(echo $d | sed 's/^\///')"
    if [ -z "$d" ] ; then
        d=".."
    fi
    cd "$d"
}

# tmux update env command
function tmux() {
    local tmux=$(type -fp tmux)
    case "$1" in
        update-environment|update-env|env-update)
            local v
            while read v ; do
                if [[ $v == -* ]] ; then
                    unset ${v/#-/}
                else
                    v=${v/=/=\"}
                    v=${v/%/\"}
                    eval export $v
                fi
            done < <(tmux show-environment)
            ;;
        *)
            $tmux "$@"
            ;;
    esac
}

# Machine specific env variables go here

# set editor
export EDITOR=vim

#export LESS="-N"

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ] ; then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
