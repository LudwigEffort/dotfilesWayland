#############################################################
#                                                           #
#    ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗    #
#    ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║    #
#      ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║    #
#     ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝    #
#    ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝     #
#    ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝      #
#                                                           #
#############################################################

########## Theme ##########

### Starship Prompt
eval "$(starship init zsh)"

### Icons
[ -f "${XDG_CONFIG_HOME}/zsh/icons.txt" ] && source "${XDG_CONFIG_HOME}/zsh/icons.txt"

#export GTK_THEME="Gruvbox-Dark"

########### Software & Apps ###########

### Default
#export TERMINAL="foot"
#export EDITOR="emacsclient -t -a ''"
#export VISUAL="emacsclient -t -a ''"
#export BROWSER="firefox"
#export VIDEO="mpv"
#export IMAGE="nsxiv"

#export LIBVA_DRIVER_NAME=iHD

# Emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

# Vim
#export VIMINIT="source $XDG_CONFIG_HOME/nvim/init.vim"

### Manpager
export MANPAGER="less -R --use-color -Dd+r -Du+b"
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

########## Paths ##########

# Adds ~/.local/bin and subfolders to $PATH
export PATH="$HOME/.local/bin:$PATH"

# USR Paths
export USR_SHARE="/usr/share"

# Software Paths
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
#export GIT_CONFIG="$XDG_CONFIG_HOME/git"

export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"

########## Cleaning up home folder ###########
export HISTFILE="$HOME/bash/history"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"

# Cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export NUGET_PACKAGES="$XDG_CACHE_HOME/nuget"

# Data
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"



export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"


export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
