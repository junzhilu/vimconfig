" Install plug.vim
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif



" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
colorscheme gruvbox
filetype on
filetype plugin indent on

set cmdheight=1
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set fileformat=unix
set number                              " Line numbers
set ruler              			            " Show the cursor position all the time
set mouse=a                             " Enable your mouse
set expandtab                           " Converts tabs to spaces
set tabstop=4                           " Insert 4 spaces for a tab
set showtabline=4                       " Always show tabs
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set autoindent                          " Good auto indent
set colorcolumn=120
set nowrap                              " Display long lines as just one line

set splitright                          " Vertical splits will automatically be to the right
set splitbelow
set conceallevel=0                      " So that I can see `` in markdown files
set clipboard=unnamedplus               " Copy paste between vim and everything else
set t_Co=256                            " Support 256 colors
set iskeyword+=-                      	" treat dash separated words as a word text object
set autochdir                           " Your working directory will always be the same as your working directory
set updatetime=100

" code folding
set foldmethod=indent
set foldlevel=99

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" move through split windows
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>

" netrw
" Toggle Vexplore with Ctrl-E
" Open new file vertical
let g:netrw_browse_split = 2
" Default width 25%
let g:netrw_winsize = 25
let g:netrw_list_hide=".*\.pyc$"

map <leader>e :Lexplore<CR>


" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %      

" You can't stop me
cmap w!! w !sudo tee %

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" tags
map <leader>t :TagbarToggle<CR>

autocmd filetype swift nnoremap <F5> :w <bar> exec '!swift '.shellescape('%')<CR>
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv
"
" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Code foldering
set foldmethod=indent

" Git Gutter
let g:gitgutter_map_keys = 0
nmap [ <Plug>(GitGutterPrevHunk)
nmap ] <Plug>(GitGutterNextHunk)

" vim-fugitive
nmap <leader>gs :G<CR>

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Maximizer
nnoremap <leader>m :MaximizerToggle<CR>
vnoremap <leader>m :MaximizerToggle<CR>gv
inoremap <leader>m <C-o>:MaximizerToggle<CR>

map <C-w> <ESC>:bd<CR>

"auto black @AL by Jonathan
autocmd BufWritePre package.py let b:runBlack=0
fun! BlackityBlack()
    if exists('b:runBlack')
        return
    endif
    execute ':Black'
endfun
let g:black_fast = 1
au BufEnter * let g:black_linelength=88
au BufEnter Filament/**/*.py let g:black_linelength=110
au BufEnter filament/**/*.py let g:black_linelength=110
autocmd BufWritePre *.py call BlackityBlack()
