if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'yko/mojo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gmarik/Vundle.vim'
Plug 'henrik/vim-indexed-search' " Plugin to show total of matches
Plug 'itchyny/lightline.vim' " lightline-ale
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'maximbaz/lightline-ale'
" Plug 'rdunklau/vim-perltidy'
Plug 'tpope/vim-surround'
Plug 'vim-perl/vim-perl6'
Plug 'dense-analysis/ale'
"React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
"Markdown
Plug 'iamcco/markdown-preview.nvim' , { 'do': 'cd app & yarn install'  }
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
" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Elixir
Plug 'elixir-editors/vim-elixir'
" Elm
Plug 'andys8/vim-elm-syntax'
" Themes
" Plug 'swalladge/paper.vim'
" Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'joukevandermaas/vim-ember-hbs'

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

set number
set relativenumber
if(has("termguicolors"))
    set termguicolors
endif
syntax on
" set background=dark
" colorscheme jellybeans
" colorscheme PaperColor
let g:onedark_terminal_italics = 1
colorscheme onedark

set laststatus=2
set mouse=a " Enable the mouse

set backspace=indent,eol,start

set tabstop=8
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab

set clipboard=unnamed
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

" let g:perltidy = 0
set textwidth=80
set colorcolumn=80 
nnoremap <Leader>f :NERDTreeToggle<CR>

"fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_files_options ='--preview "bat {}"'
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nmap <C-a> :Ack!<Space>
"buffers
nnoremap <leader>bo :Buffers<CR>
set hidden "to switch between buffers

"ALE
" let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert 
" let g:ale_set_balloons = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_linters = { 'perl': ['perl','perlcritic'] }
let g:ale_fixers = { 'perl': ['perltidy'], 'html': ['tidy'], 'json': ['fixjson']}
nmap <leader>d <Plug>(ale_fix)

"Deoplete
let g:deoplete#enable_at_startup = 1

"react
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
let g:lightline.colorscheme = 'onedark'
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

" from https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#tmux-21-and-above
highlight Comment cterm=italic
" Add truecolor support to tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

if !has('nvim') " Vim 8 only
	pythonx import pynvim
endif

set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }
