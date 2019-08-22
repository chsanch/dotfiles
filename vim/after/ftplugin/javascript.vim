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
let b:ale_lint_on_save = 1
let b:ale_lint_on_insert_leave = 1
let b:ale_javascript_eslint_use_global = 1
" let b:ale_lint_on_text_changed = 'never' 
" let g:ale_javascript_tsserver_use_global=1
" let g:ale_javascript_tsserver_executable='/Users/chsanch/.nodenv/versions/8.11.4/bin/tsserver'
" https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd+=.js
