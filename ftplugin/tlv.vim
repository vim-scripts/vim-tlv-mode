" Vim file type plug-in
" Language: TLV (Transaction-Level Verilog)
" Author: Peter Odding <peter@peterodding.com>
" Last Change: April 3, 2015
" URL: https://github.com/xolox/vim-tlv-mode

if exists('b:did_ftplugin')
  finish
else
  let b:did_ftplugin = 1
endif

" A list of commands that undo buffer local changes made below.
let s:undo_ftplugin = []

" Make <Tab> insert spaces instead of real tabs. {{{1
setlocal expandtab
call add(s:undo_ftplugin, 'setlocal expandtab<')

" Make <Tab> insert three spaces. {{{1
setlocal tabstop=3 shiftwidth=3
call add(s:undo_ftplugin, 'setlocal tabstop< shiftwidth<')

" Enable support for automatic indentation. {{{1
setlocal indentexpr=tlv#indentexpr()
call add(s:undo_ftplugin, 'setlocal indentexpr<')

" Enable support for automatic text folding. {{{1
setlocal foldmethod=expr foldexpr=tlv#foldexpr()
call add(s:undo_ftplugin, 'setlocal foldmethod< foldexpr<')

" Define a command to check the syntax of TLV files. {{{1
command! -bar -buffer CheckSyntax call tlv#check_syntax()
call add(s:undo_ftplugin, 'delcommand CheckSyntax')

" Define an automatic command to check for syntax errors on save. {{{1
augroup PluginFileTypeTLV
  autocmd! PluginFileTypeTLV BufWritePost <buffer> call tlv#auto_check_syntax()
augroup END
call add(s:undo_ftplugin, 'autocmd! PluginFileTypeTLV BufWritePost <buffer>')

" }}}1

" Let Vim know how to disable the plug-in.
call map(s:undo_ftplugin, "'execute ' . string(v:val)")
let b:undo_ftplugin = join(s:undo_ftplugin, ' | ')
unlet s:undo_ftplugin

" vim: ts=2 sw=2 et
