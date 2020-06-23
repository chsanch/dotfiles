let b:ale_linters = ['tsserver']
let b:ale_fixers = ['prettier']
let b:ale_lint_on_save = 1
let b:ale_lint_on_insert_leave = 1
" let b:typescript_indent_disable = 1
setlocal formatprg=prettier\ --parser\ typescript
