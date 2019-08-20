set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Bundle 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'yko/mojo.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'rdunklau/vim-perltidy'
Plugin 'tpope/vim-surround'
" Plugin to show total of matches
Plugin 'henrik/vim-indexed-search'
Plugin 'itchyny/lightline.vim'
" lightline-ale
Plugin 'maximbaz/lightline-ale'

Plugin 'vim-perl/vim-perl6'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'dense-analysis/ale'
Plugin 'airblade/vim-gitgutter'

"React
Plugin 'pangloss/vim-javascript'
"Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier'
Plugin 'styled-components/vim-styled-components'
"Theme
Plugin 'Lokaltog/vim-monotone'

"Markdown
Plugin 'iamcco/markdown-preview.vim'
"icons
Plugin 'ryanoasis/vim-devicons'
" editorconfig
Plugin 'editorconfig/editorconfig-vim'
" typescript
Plugin 'leafgarland/typescript-vim'
" comments
Plugin 'tpope/vim-commentary'
" Ack
Plugin 'mileszs/ack.vim'
" to close buffers
Plugin 'qpkorr/vim-bufkill'
" Elm
Plugin 'andys8/vim-elm-syntax'
" Rust
Plugin 'rust-lang/rust.vim'
" Tmux integration
Plugin 'benmills/vimux'

let g:AutoPairsShortcutFastWrap="<m-e>"

call vundle#end()            " required
filetype plugin indent on    " required

set number
set relativenumber
" Theme config
syntax on
if(has("termguicolors"))
	set termguicolors
endif

set background=dark
let g:one_allow_italics = 1
let g:monotone_emphasize_comments = 1 " Emphasize comments"
colorscheme monotone
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

set pastetoggle=<F2>
com! FormatJSON %!python -m json.tool

let g:perltidy = 0
set textwidth=80
set colorcolumn=80 
" vinegar
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_files_options ='--preview "bat {}"'
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nmap <C-a> :Ack!<Space>
"buffers
nnoremap <leader>bo :Buffers<CR>
set hidden "to switch between buffers

"ALE
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert 
let g:ale_lint_on_text_changed = 0 
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_linters = { 'perl': ['perl','perlcritic'] }
let g:ale_fixers = { 'perl': ['perltidy'], 'html': ['tidy'], 'json': ['fixjson']}
nmap <leader>d <Plug>(ale_fix)

"react
let g:user_emmet_leader_key='<Tab>'
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

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

"jsx syntax
let g:vim_jsx_pretty_colorful_config = 1

" vimux
nmap <leader>vp :VimuxPromptCommand<CR>
nmap <leader>vl :VimuxRunLastCommand<CR>
" from https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#tmux-21-and-above
highlight Comment cterm=italic
" Add truecolor support to tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
set updatetime=100

" bind K to grep word under cursor https://thoughtbot.com/blog/faster-grepping-in-vim
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
