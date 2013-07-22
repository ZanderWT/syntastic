"============================================================================
"File:        vimlint.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Daan Bakker <bluedaan at gmail dot com>
"License:     Distributed under the same terms as Vim itself.
"             See :help license.
"============================================================================

if exists('g:loaded_syntastic_vim_vimlint_checker')
    finish
endif
let g:loaded_syntastic_vim_vimlint_checker = 1

function! SyntaxCheckers_vim_vimlint_IsAvailable()
    return executable('vimlint')
endfunction

function! SyntaxCheckers_vim_vimlint_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'vimlint',
        \ 'filetype': 'vim',
        \ 'subchecker': 'vimlint' })

    let errorformat =
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
      \ 'filetype': 'vim',
      \ 'name': 'vimlint'})

" vim: set et sts=4 sw=4:
