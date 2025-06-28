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

#zmodload zsh/zprof zsh log

# Lines configured by zsh-newuser-install
HISTFILE="${XDG_CONFIG_HOME}/zsh/.histfile"
HISTSIZE=10000
SAVEHIST=10000

setopt globdots

#autoload -Uz compinit
#compinit -C

# Directory color scheme ?
test -r ~/.dir_colors/dir_colors && eval $(dircolors ~/.dir_colors/dir_colors)

##### Alias
[ -f "${XDG_CONFIG_HOME}/zsh/aliases" ] && source "${XDG_CONFIG_HOME}/zsh/aliases"

########## Plugins & Scripts ##########

# From repository
[ -f "${USR_SHARE}/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
[ -f "${USR_SHARE}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "${USR_SHARE}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "${USR_SHARE}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "${USR_SHARE}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# From github
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/lib/functions.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/lib/functions.zsh"
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/urlencode.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/urlencode.zsh"
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/web-search.plugin.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/web-search.plugin.zsh"
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/dirhistory.plugin.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/dirhistory.plugin.zsh"

# Scripts
[ -f "${XDG_CONFIG_HOME}/zsh/plugins/ssh_agent.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/plugins/ssh_agent.zsh"

########## Keybindings ##########

### Emacs Binding Keys
bindkey -e

### Bind arrow keys
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

bindkey '^I' autosuggest-accept  # ^I è il codice per TAB

### Autocomplete
#zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
#zstyle ':autocomplete:*history*:*' insert-unambiguous yes
#zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

zstyle ':autocomplete:*' min-delay 1
zstyle ':autocomplete:*' min-input 4
zstyle ':autocomplete:*' max-lines 10
zstyle ':autocomplete:*' automatic-insert off

zstyle ':autocomplete:*' ignored-input '^pacman.*'

zstyle ':completion:*' rehash true

bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select

bindkey -M menuselect '^M' .accept-line  
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

#bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
#bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

### Bind vim keys (in conflict with vterm from emacs)
#bindkey '^j' history-substring-search-up
#bindkey '^k' history-substring-search-down

#zprof > ~/zprof_log_now.txt # zsh log

#compdef -d pacman
