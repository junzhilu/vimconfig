call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'psf/black'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdcommenter'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'kdheepak/lazygit.nvim'
call plug#end()
