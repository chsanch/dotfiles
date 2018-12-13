set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'yko/mojo.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'rdunklau/vim-perltidy'
Plugin 'tpope/vim-surround'
" Plugin to show total of matches
Plugin 'henrik/vim-indexed-search'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-perl/vim-perl6'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'

"React
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'

Plugin 'nanotech/jellybeans.vim'

"Markdown
Plugin 'iamcco/markdown-preview.vim'
"icons
Plugin 'ryanoasis/vim-devicons'
" editorconfig
Plugin 'editorconfig/editorconfig-vim'
" typescript
Plugin 'leafgarland/typescript-vim'
" For jsctags
Plugin 'ternjs/tern_for_vim'
" comments
Plugin 'tpope/vim-commentary'
" Ack
Plugin 'mileszs/ack.vim'
" to close buffers
Plugin 'qpkorr/vim-bufkill'
" Rust
Plugin 'rust-lang/rust.vim'

let g:AutoPairsShortcutFastWrap="<m-e>"

call vundle#end()            " required
filetype plugin indent on    " required

set number
set relativenumber
syntax enable
set background=dark
colorscheme jellybeans

set laststatus=2
set mouse=a " Enable the mouse

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4

set clipboard=unnamed
let g:syntastic_enable_perl_checker = 1
" things from https://danielmiessler.com/study/vim/
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
" from https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
au BufNewFile,BufRead *.py
	 \ set tabstop=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_higlight_all=1

set pastetoggle=<F2>
com! FormatJSON %!python -m json.tool

let g:perltidy = 0
set textwidth=80
set colorcolumn=80 
nnoremap <Leader>f :NERDTreeToggle<CR>

"fzf
set rtp+=/usr/local/opt/fzf
nmap <C-p> :Files<CR>
nmap <C-a> :Ack!<Space>
"buffers
nnoremap <leader>b :Buffers<CR>
set hidden "to switch between buffers
nmap <Leader>w :BD<cr>

"ALE
let g:ale_lint_on_text_changed = 'never' 
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_linters = { 'perl': ['perl','perlcritic'] }
let g:ale_fixers = { 'perl': ['perltidy'], 'javascript': ['eslint'], 'html': ['tidy'], 'json': ['fixjson']}
nmap <leader>d <Plug>(ale_fix)

"react
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"icons
set guifont=DroidSansMono\ Nerd\ Font:h11
"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" tagbar key shorcut
nmap <leader>t :TagbarToggle<CR>
" tagbar typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
" swp files
set directory^=$HOME/.vim/tmp//
let g:lightline = { 
	\'colorscheme' : 'jellybeans',
	\'active': {
	\	'left': [ ['mode', 'paste'],
	\			  ['gitbranch', 'readonly', 'filename', 'modified']]
	\},
	\'component_function': {
	\	'gitbranch': 'fugitive#head'
	\}
\}

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
