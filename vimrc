call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'


"Themes
Plug 'Lokaltog/vim-monotone'
Plug 'arzg/vim-substrata'
Plug 'junegunn/seoul256.vim'

"LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

syntax on
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
set number
set cursorline
set backspace=indent,eol,start
set laststatus=2
set mouse=a " Enable the mouse
let mapleader = "\<Space>"
set encoding=utf-8
" thing from https://dougblack.io/words/a-good-vimrc.html
set wildmenu
set cursorline
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
set foldnestmax=10

" if(has("termguicolors"))
" 	set termguicolors
" endif

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

colo substrata
" highlight Comment cterm=italic gui=italic
let g:substrata_italic_comments = 1
let g:substrata_italic_functions = 1

set clipboard=unnamed
set background=dark
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4

"ALE
"let g:ale_completion_enabled = 1
" set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
nmap <leader>f <Plug>(ale_fix)


"asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" statusline
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline.colorscheme = 'PaperColor'
let g:lightline.component_function = { 'gitbranch':'fugitive#head' }
let g:lightline.active = {
	\ 'left': [ [ 'mode', 'paste' ],
	\           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ],
	\            [ 'fileformat', 'fileencoding', 'filetype' ],
	\            [  'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ] }

com! FormatJSON %!python -m json.tool

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" swp files
set directory^=$HOME/.vim/tmp//

set updatetime=100

"fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_files_options ='--preview "bat {}"'
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
" nmap <C-a> :Ack!<Space>
nnoremap \ :Ag<CR>
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
" bind K to grep word under cursor https://thoughtbot.com/blog/faster-grepping-in-vim
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
