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
let b:ale_fixers = ['add_blank_lines_for_python_control_statements','yapf']
let b:ale_linters = ['flake8']
let b:ale_lint_on_save = 1
let b:ale_lint_on_insert_leave = 1
set omnifunc=ale#completion#OmniFunc
