let b:ale_dart_dartfmt_executable="/Users/chsanch/flutter/bin/cache/dart-sdk/bin/dartfmt"
let b:ale_fixers = ["dartfmt"]
" let b:ale_dart_dartanalyzer_executable="dartlsp"
" let b:lsc_auto_map = v:true
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}
let b:lsc_dart_enable_log = v:true
let b:lsc_enable_autocomplete = v:false
noremap <buffer> <leader>tr :DartToggleMethodBodyType<cr>
" let g:lsc_server_commands = {'dart': { 'name': 'dart', 'command': 'dart /usr/local/opt/dart/libexec/bin/snapshots/analysis_server.dart.snapshot --lsp' }}
call FlutterMenu()
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
