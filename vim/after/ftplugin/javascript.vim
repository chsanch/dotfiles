"To be used with: https://github.com/romainl/ctags-patterns-for-javascript && 
" https://github.com/majutsushi/tagbar/wiki#javascript
let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}
let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['eslint']
let b:ale_sign_error = '>>'
let b:ale_sign_warning = '--'
let b:ale_lint_on_save = 1

" https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd+=.js
