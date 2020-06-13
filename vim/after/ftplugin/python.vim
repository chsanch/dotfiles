" let g:SimpylFold_docstring_preview = 1
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" au BufNewFile,BufRead *.py
" 	\ set tabstop=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix
" highlight BadWhitespace ctermbg=red guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" let python_higlight_all=1
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions+=croql
let python_highlight_all = 1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let b:ale_fixers = ['add_blank_lines_for_python_control_statements','black']
let b:ale_linters = ['pyls']
let b:ale_lint_on_save = 1
let b:ale_lint_on_insert_leave = 1
set omnifunc=ale#completion#OmniFunc

