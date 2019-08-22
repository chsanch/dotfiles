" this require to install https://github.com/elm-tooling/elm-language-server
let b:ale_linters = { 'elm': ['elm_ls'] }
let b:ale_fixers = ['elm-format']
let b:ale_lint_on_save = 1
let b:ale_lint_on_insert_leave = 1
set omnifunc=ale#completion#OmniFunc
