# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'branch: %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Color on prompts
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='%F{yellow} $vcs_info_msg_0_'

# Page up/down to search commands history
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward

# Colors for ls
alias ls="ls -G"
