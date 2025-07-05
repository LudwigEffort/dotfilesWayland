##################################################
#                                                #
#    ███████╗███████╗██╗  ██╗██████╗  ██████╗    #
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝    #
#      ███╔╝ ███████╗███████║██████╔╝██║         #
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║         #
#    ███████╗███████║██║  ██║██║  ██║╚██████╗    #
#    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    #
#                                                #
##################################################

########## General Settings ##########

zmodload zsh/zprof

# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME}/zsh/histfile"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

##### Alias
#[ -f "${XDG_CONFIG_HOME}/zsh/aliases" ] && source "${XDG_CONFIG_HOME}/zsh/aliases-old"
[ -f "${XDG_CONFIG_HOME}/zsh/aliases" ] && source "${XDG_CONFIG_HOME}/zsh/aliases"

########## Plugins & Scripts ##########

# From repository
[ -f "${USR_SHARE}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "${USR_SHARE}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "${USR_SHARE}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# From AUR
[ -f "${USR_SHARE}/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh"

# From github

# Scripts
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/ssh_agent.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/ssh_agent.zsh"

########## Keybindings ##########

# Vim Binding Keys
bindkey -v
export KEYTIMEOUT=1

# Vim Keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Keybings from Emacs
bindkey '^A' beginning-of-line
bindkey '^P' history-beginning-search-backward
bindkey '^E' end-of-line
bindkey '^N' history-beginning-search-forward

# Arrow Keybindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

zprof > ~/.cache/zsh/log/zprof_log_now.txt # zsh log
