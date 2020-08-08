set number
syntax on
set ignorecase
set smartcase

autocmd Bufread,BufNewfile *.js,*.css,*.vue,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufReadPost,BufNewfile *.vue setlocal filetype=vue

" If hidden is not set, TestEdit might fail.
set hidden

" Sets vim's command height?
set cmdheight=2

set updatetime=300

set signcolumn=yes

inoremap jk <ESC>

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
		  let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

call plug#begin()

Plug 'badacadabra/vim-archery'

Plug 'flrnprz/candid.vim'

" Plug 'whatyouhide/vim-gotham'

Plug 'christoomey/vim-tmux-navigator'

Plug 'posva/vim-vue'

Plug 'neoclide/coc.nvim', { 'branch': 'release'}

Plug 'yuezk/vim-js'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'scrooloose/nerdtree'

call plug#end()

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc config
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint', 
	\ 'coc-json',
	\ ]

colo candid

autocmd VimEnter * if argc() == 0 | NERDTree | endif

nmap <C-n> :NERDTreeToggle<CR>
i
