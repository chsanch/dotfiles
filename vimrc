if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'yko/mojo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rdunklau/vim-perltidy'
Plug 'tpope/vim-surround'
" Plug to show total of matches
Plug 'henrik/vim-indexed-search'
Plug 'itchyny/lightline.vim'
" lightline-ale
Plug 'maximbaz/lightline-ale'
Plug 'vim-perl/vim-perl6'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
"React
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'
Plug 'styled-components/vim-styled-components'
"Theme
Plug 'Lokaltog/vim-monotone'
"Markdown
Plug 'iamcco/markdown-preview.vim'
"icons
Plug 'ryanoasis/vim-devicons'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" typescript
Plug 'leafgarland/typescript-vim'
" comments
Plug 'tpope/vim-commentary'
" Ack
Plug 'mileszs/ack.vim'
" to close buffers
Plug 'qpkorr/vim-bufkill'
" Elm
Plug 'andys8/vim-elm-syntax'
" Rust
Plug 'rust-lang/rust.vim'
" Tmux integration
Plug 'benmills/vimux'
call plug#end()

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
let g:ale_lint_on_text_changed = 'normal' 
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
