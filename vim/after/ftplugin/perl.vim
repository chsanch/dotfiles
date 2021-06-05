let b:ale_perl_perlcritic_showrules = 1
let b:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let b:ale_linters = { 'perl': ['perl','perlcritic'] }
let b:ale_fixers = { 'perl': ['perltidy']}
