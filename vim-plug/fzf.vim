" FZF
map <C-f> :Files<CR>
map <leader>g :Rg<CR>
let $FZF_DEFAULT_COMMAND="rg --files -g '!.git'"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
