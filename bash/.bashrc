#
# Bash startup configuration file
#
# File location: ~/.bashrc or /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable 256 colors mode in terminals
export TERM='xterm-256color'

# Add color to the prompt and a different prompt if user is root
PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[00;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "
PS2='> '
PS3='> '
PS4='+ '

#
# Set up the prompt string
#
# Available options: 
# \d: date in "Weekday Month Date" format
# \h: machine name
# \s: name of the shell
# \t: current time in HH:MM:SS format
# \u: username
# \W: basename of current working directory
# \w: current working directory
# \$: if root, a #, else a $
#
# For more options, man bash and search for PROMPTING.
PS1='[\u@\h \W]\$ '

#
# Define aliases
#
# Put some colour in your shell
alias ls='ls --color=auto'
# Ask for confirmation when deleting a file (can be overridden with -f)
alias rm='rm -i'
# Ask for confirmation when overwritting a file with cp
alias cp='cp -i'
# Ask for confirmation when overwritting a file with mv
alias mv='mv -i'
# Short version of ls with long listing format in human readable units
alias ll='ls -lh'
# Short version of ls displaying hidden files
alias la='ls -a'
# Short version of ls for lazy people
alias l='ls --group-directories-first'


#
# Export variables
#
# Defines vim as the default shell text editor
export EDITOR="vim"
# Display a fortune each time a terminal is launched
[[ "$PS1" ]] && /usr/bin/fortune

