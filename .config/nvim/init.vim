set number              " Mostra i numeri di riga
syntax on               " Abilita la sintassi colorata
set expandtab           " Usa spazi invece di tab
set tabstop=4           " Tab a 4 spazi
set shiftwidth=4        " Indentazione a 4 spazi
set autoindent          " Indenta automaticamente
set clipboard=unnamedplus " Usa clipboard di sistema

set termguicolors
set background=dark

call plug#begin('~/.local/share/nvim/plugged')

Plug 'folke/tokyonight.nvim'
"Plug 'typicode/bg.nvim'

call plug#end()

colorscheme tokyonight-night
