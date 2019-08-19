# this require to install https://github.com/elm-tooling/elm-language-server
let b:ale_linters = { 'elm': ['elm_ls'] }
let b:ale_fixers = ['elm-format']
set omnifunc=ale#completion#OmniFunc
