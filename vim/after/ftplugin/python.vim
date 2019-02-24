" from https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
let g:SimpylFold_docstring_preview = 1
setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
setlocal foldexpr< foldmethod<
setlocal tabstop=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
highlight BadWhitespace ctermbg=red guibg=darkred
match BadWhitespace /\s\+$/
let python_higlight_all=1

