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
colorscheme onedark
filetype on
filetype plugin indent on

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
set conceallevel=0                      " So that I can see `` in markdown files
set clipboard=unnamedplus               " Copy paste between vim and everything else
set t_Co=256                            " Support 256 colors
set iskeyword+=-                      	" treat dash separated words as a word text object
set autochdir                           " Your working directory will always be the same as your working directory

" code folding
set foldmethod=indent
set foldlevel=99

"set hidden                              " Required to keep multiple buffers open multiple buffers
"set nowrap                              " Display long lines as just one line
"set encoding=utf-8                      " The encoding displayed
"set pumheight=10                        " Makes popup menu smaller
"set fileencoding=utf-8                  " The encoding written to file
"set ruler              			            " Show the cursor position all the time
"set cmdheight=2                         " More space for displaying messages
"set iskeyword+=-                      	" treat dash separated words as a word text object
"set mouse=a                             " Enable your mouse
"set splitbelow                          " Horizontal splits will automatically be below
"set splitright                          " Vertical splits will automatically be to the right
"set t_Co=256                            " Support 256 colors
"set conceallevel=0                      " So that I can see `` in markdown files
"set tabstop=2                           " Insert 2 spaces for a tab
"set shiftwidth=2                        " Change the number of space characters inserted for indentation
"set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
"set expandtab                           " Converts tabs to spaces
"set smartindent                         " Makes indenting smart
"set autoindent                          " Good auto indent
"set laststatus=0                        " Always display the status line
"set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line
"set background=dark                     " tell vim what the background color looks like
"set showtabline=2                       " Always show tabs
"set noshowmode                          " We don't need to see things like -- INSERT -- anymore
"set nobackup                            " This is recommended by coc
"set nowritebackup                       " This is recommended by coc
"set updatetime=300                      " Faster completion
"set timeoutlen=500                      " By default timeoutlen is 1000 ms
"set formatoptions-=cro                  " Stop newline continution of comments
"set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

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

" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
"let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

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

